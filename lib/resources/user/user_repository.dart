import 'package:mcs/models/models.dart' show UserModel, BaseModel, ReviewModel;
import 'package:mcs/models/payment/order.model.dart';

abstract class UserRepository {
  Future<BaseModel<UserModel>> userLogin(String mobileNumber);
  Future<BaseModel<UserModel>> verifyOtp(
      String token, String mobile, String otp);
  Future<BaseModel<UserModel>> register(
      Map<String, dynamic> registerData, String token);

  Future<ReviewModel> submitReview(String token, Map<String, dynamic> data);

  /// create order api to automatic capture payment
  Future<OrderModel> createOrderApi(String token, OrderModel data);
}
