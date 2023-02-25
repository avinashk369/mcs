import 'dart:convert';

import 'package:mcs/models/models.dart';
import 'package:mcs/resources/user/user_repository.dart';
import 'package:mcs/services/ApiClient.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({required this.apiClient});

  @override
  Future<UserModel> userLogin(String mobileNumber) async {
    late UserModel userMasters;
    try {
      Map<String, dynamic> body = {"mobile": mobileNumber};
      userMasters = (await apiClient.userLogin(body));
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return userMasters;
  }

  @override
  Future<UserModel> verifyOtp(String mobile, int otp) async {
    late UserModel userModel;
    try {
      Map<String, dynamic> body = {"otp": otp, "mobile_number": mobile};
      userModel = await apiClient.otpVerificaiotn(body);
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return userModel;
  }

  @override
  Future<UserModel> register(
      Map<String, dynamic> registerData, String token) async {
    UserModel userMasters = UserModel();
    try {
      userMasters =
          await apiClient.userRegistration(token, jsonEncode(registerData));
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return userMasters;
  }

  @override
  Future<UserModel> resendOtp(String mobileNumber) async {
    late UserModel userMasters;
    try {
      Map<String, dynamic> body = {"mobile": mobileNumber};
      userMasters = (await apiClient.resendOtp(body));
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return userMasters;
  }
}
