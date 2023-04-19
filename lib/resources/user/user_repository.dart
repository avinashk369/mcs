import 'package:mcs/models/models.dart' show UserModel;

abstract class UserRepository {
  Future<UserModel> userLogin(String mobileNumber);
  Future<UserModel> resendOtp(String mobileNumber);
  Future<UserModel> verifyOtp(String mobile, int otp);
  Future<UserModel> saveAddress(Map<String, dynamic> data);
  Future<UserModel> register(Map<String, dynamic> registerData, String token);
}
