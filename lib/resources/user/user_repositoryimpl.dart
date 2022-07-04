import 'dart:convert';

import 'package:mcs/models/models.dart';
import 'package:mcs/models/payment/order.model.dart';
import 'package:mcs/resources/user/user_repository.dart';
import 'package:mcs/services/ApiClient.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({required this.apiClient});

  Future<BaseModel<UserModel>> getHomeData(UserModel userMaster) async {
    UserModel userMasters;
    try {
      userMasters = await apiClient.getHomeFeatureData("accetoken");
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      /**
       * either api run or failed this method will always return basemodel class
       * if api fails we set exception in the base model class
       * if api works then we set api response into basemodel data variable
       */
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = userMasters;
  }

  @override
  Future<BaseModel<UserModel>> userLogin(String mobileNumber) async {
    late UserModel userMasters;
    try {
      Map<String, dynamic> body = {"mobile": mobileNumber, "user_type": "user"};
      userMasters = await apiClient.userLogin(body);
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return BaseModel()..data = userMasters;
  }

  @override
  Future<BaseModel<UserModel>> verifyOtp(
      String token, String mobile, String otp) async {
    UserModel userMasters = UserModel();
    try {
      Map<String, dynamic> body = {"otp": otp, "mobile": mobile};
      userMasters = await apiClient.otpVerificaiotn("Bearer " + token, body);
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return BaseModel()..data = userMasters;
  }

  @override
  Future<BaseModel<UserModel>> register(
      Map<String, dynamic> registerData, String token) async {
    UserModel userMasters = UserModel();
    try {
      userMasters =
          await apiClient.userRegistration(token, jsonEncode(registerData));
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return BaseModel()..data = userMasters;
  }

  @override
  Future<ReviewModel> submitReview(
      String token, Map<String, dynamic> data) async {
    ReviewModel reviewModel;
    try {
      Map<String, dynamic> reviewdata = {
        "id": "1",
        "review": "Brilliant service"
      };
      reviewModel = ReviewModel.fromJson(reviewdata);
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return reviewModel;
  }

  @override
  Future<OrderModel> createOrderApi(String token, OrderModel data) async {
    late OrderModel orderModel;
    try {
      orderModel = await apiClient.createOrderApi("Basic $token", data);
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return orderModel;
  }
}
