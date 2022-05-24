import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/models/payment/order.model.dart';
import 'package:mcs/resources/user/user_repository.dart';
import 'package:mcs/services/ApiClient.dart';

class UserRepositoryImpl implements UserRepository {
  late Dio dio;
  late ApiClient apiClient;
  UserRepositoryImpl() {
    dio = Dio();
    //dio.options.headers["Content-Type"] = "application/json";
    //dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      request: true,
      requestBody: true,
    ));
    apiClient = ApiClient(dio);
  }

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
  Future<List<UserVehicleModel>> userVehicles(
      String token, String userId) async {
    List<UserVehicleModel> userVehicles = [];
    try {
      UserVehicleModel userVehicle =
          await apiClient.getUserVehicle("Bearer " + token, userId);
      userVehicles = userVehicle.vehicles!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return userVehicles;
  }

  @override
  Future<List<BookingModel>> loadBookings(String token, String userId) async {
    List<BookingModel>? bookings;
    try {
      bookings = await apiClient.getAllBookings("Bearer $token", userId);
    } catch (error, stacktrace) {
      print(stacktrace.toString());
      throw ServerError.withError(error: error);
    }
    return [...bookings];
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
  Future<BaseModel<List<UserVehicleModel>>> saveUserVehicle(
      String token, UserVehicleModel data) async {
    late List<UserVehicleModel> userVehicleModel;
    try {
      Map<String, dynamic> vData = {
        "v_type": data.vType!.id!,
        "v_model": data.vModel,
        "v_number": data.vNumber
      };

      UserVehicleModel userVModel =
          await apiClient.saveUserVehicle("Bearer " + token, data.uId!, vData);
      userVehicleModel = userVModel.vehicles!;
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return BaseModel()..data = userVehicleModel;
  }

  @override
  Future<BaseModel<BookingModel>> addBooking(
      String token, Map<String, dynamic> data) async {
    late BookingModel bookingModel;
    try {
      bookingModel =
          await apiClient.saveUserBookingData("Bearer " + token, data);
    } catch (error, stacktrace) {
      throw ServerError.withError(error: error);
    }
    return BaseModel()..data = bookingModel;
  }

  @override
  Future<BookingModel> updateBooking(
      {required String token,
      required String bookingId,
      required BookingModel bookingModel}) async {
    BookingModel? booking;
    try {
      booking = await apiClient.updateBooking(
          "Bearer $token", bookingId, bookingModel);
    } catch (error, stacktrace) {
      print(stacktrace);
      throw ServerError.withError(error: error);
    }
    return booking;
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
