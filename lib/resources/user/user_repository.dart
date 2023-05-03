import 'package:mcs/models/models.dart' show UserModel, BaseResponse;

import '../../models/user/auth_model.dart';

abstract class UserRepository {
  Future<AuthModel> userLogin(String mobileNumber);
  Future<UserModel> resendOtp(String mobileNumber);
  Future<BaseResponse<UserModel>> verifyOtp(String mobile, int otp);
  Future<UserModel> saveAddress(Map<String, dynamic> data);
  Future<UserModel> register(Map<String, dynamic> registerData, String token);
}
