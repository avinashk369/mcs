import 'package:mcs/models/models.dart'
    show UserModel, BaseResponse, UserAddress;

import '../../models/user/auth_model.dart';

abstract class UserRepository {
  Future<AuthModel> userLogin(String mobileNumber);
  Future<UserModel> resendOtp(String mobileNumber);
  Future<BaseResponse<UserModel>> verifyOtp(String mobile, int otp);
  Future<bool> saveAddress(Map<String, dynamic> data);
  Future<UserModel> register(Map<String, dynamic> registerData, String token);
  Future<BaseResponse<UserModel>> updateProfile(UserModel userModel);
  Future<List<UserAddress>> loadAddress(Map<String, dynamic> data);
  Future<BaseResponse> setDefaultAddress(Map<String, dynamic> data);
}
