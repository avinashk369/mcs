import 'package:mcs/models/models.dart'
    show UserModel, UserVehicleModel, BaseModel, BookingModel, ReviewModel;
import 'package:mcs/models/payment/order.model.dart';

abstract class UserRepository {
  Future<BaseModel<UserModel>> userLogin(String mobileNumber);
  Future<BaseModel<UserModel>> verifyOtp(
      String token, String mobile, String otp);
  Future<BaseModel<UserModel>> register(
      Map<String, dynamic> registerData, String token);
  Future<List<UserVehicleModel>> userVehicles(String token, String userId);
  Future<List<BookingModel>> loadBookings(String token, String userId);
  Future<ReviewModel> submitReview(String token, Map<String, dynamic> data);
  Future<BaseModel<List<UserVehicleModel>>> saveUserVehicle(
      String token, UserVehicleModel data);
  Future<BaseModel<BookingModel>> addBooking(
      String token, Map<String, dynamic> data);
  Future<BookingModel> updateBooking(
      {required String token,
      required String bookingId,
      required BookingModel bookingModel});

  /// create order api to automatic capture payment
  Future<OrderModel> createOrderApi(String token, OrderModel data);
}
