import 'dart:convert';

import 'package:mcs/models/models.dart';
import 'package:mcs/resources/user/user_repository.dart';
import 'package:mcs/services/ApiClient.dart';

import '../../models/user/auth_model.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({required this.apiClient});

  @override
  Future<AuthModel> userLogin(String mobileNumber) async {
    late AuthModel authModel;
    try {
      Map<String, dynamic> body = {"mobile_no": mobileNumber};
      authModel = (await apiClient.userLogin(body));
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return authModel;
  }

  @override
  Future<BaseResponse<UserModel>> verifyOtp(String mobile, int otp) async {
    late BaseResponse<UserModel> userModel;
    try {
      Map<String, dynamic> body = {"otp": otp, "mobile_no": mobile};
      userModel = await apiClient.otpVerificaiotn(body);
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return userModel;
  }

  @override
  Future<UserModel> register(
      Map<String, dynamic> registerData, String token) async {
    UserModel userMasters = const UserModel();
    try {
      userMasters =
          await apiClient.userRegistration(token, jsonEncode(registerData));
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return userMasters;
  }

  @override
  Future<UserModel> resendOtp(String mobileNumber) async {
    late UserModel userMasters;
    try {
      Map<String, dynamic> body = {"mobile_no": mobileNumber};
      userMasters = (await apiClient.resendOtp(body));
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return userMasters;
  }

  @override
  Future<UserModel> saveAddress(Map<String, dynamic> data) async {
    late UserModel userMaster;
    try {
      userMaster = (await apiClient.saveUserAddress(data)).data!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return userMaster;
  }
}
