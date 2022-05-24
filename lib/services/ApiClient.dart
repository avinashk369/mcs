import 'package:dio/dio.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/models/payment/order.model.dart';
import 'package:mcs/models/payment/transfer.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mcs/utils/utils.dart';
part 'ApiClient.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("Home/HomeFeaturesData")
  Future<UserModel> getHomeFeatureData(
      @Header("Authorization") String accetoken);

  @POST("auth")
  @FormUrlEncoded()
  Future<UserModel> userLogin(
    @Body() Map<String, dynamic> data,
  );

  @POST("auth/verifyOtp")
  @FormUrlEncoded()
  Future<UserModel> otpVerificaiotn(
    @Header("Authorization") String accetoken,
    @Body() Map<String, dynamic> data,
  );

  // get all the merchants based on lat lng and radius
  @GET("merchant/")
  Future<List<MerchantModel>> getAllMerchants(
    @Header("Authorization") String token,
    @Queries() Map<String, dynamic> query,
  );
  // save user booking data
  @POST("booking/")
  Future<BookingModel> saveUserBookingData(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> data,
  );

  /// get all the bookings by user id
  @GET("user/{id}/bookings")
  Future<List<BookingModel>> getAllBookings(
    @Header("Authorization") String token,
    @Path("id") String userId,
  );

  /// get location suggestion
  //Future<SuggestionDetail> getLocationSuggestion();

  /// get all subscription list
  @POST("auth/register")
  @FormUrlEncoded()
  Future<UserModel> userRegistration(
    @Field("token") String token,
    @Field("registerData") String registerData,
  );

  // get user vehicles list
  @GET("user/{id}/vehicle")
  Future<UserVehicleModel> getUserVehicle(
    @Header("Authorization") String token,
    @Path("id") String userId,
  );

  @POST("user/{id}/vehicle")
  Future<UserVehicleModel> saveUserVehicle(
    @Header("Authorization") String token,
    @Path("id") String userId,
    @Body() Map<String, dynamic> data,
  );

  @GET("vehicle")
  Future<List<VehicleType>> getVtype(
    @Header("Authorization") String token,
  );

  /// update order status if payment failed
  @PATCH("booking/{id}")
  @FormUrlEncoded()
  Future<BookingModel> updateBooking(@Header("Authorization") String token,
      @Path("id") String bookingId, @Body() BookingModel bookingModel);

  /// create order api
  @POST("https://api.razorpay.com/v1/orders")
  Future<OrderModel> createOrderApi(
    @Header("Authorization") String token,
    @Body() OrderModel data,
  );

  /// split and transfer api
  @POST("https://api.razorpay.com/v1/payments/{pay_id}/transfers")
  Future<TransferModel> splitAndTransferApi(
      @Header("Authorization") String token,
      @Path("pay_id") String paymentId,
      @Body() TransferModel transferModel);

  /// save payment log into the database table
  @POST("booking/paymentLog")
  Future<PaymentModel> logPayment(
    @Header("Authorization") String token,
    @Body() PaymentModel paymentModel,
  );
  // /// place subscription order
  // @POST("payment/order-with-rozorpay")
  // @FormUrlEncoded()
  // Future<OrderModel> addSubscriptionOrder(
  //   @Header("Authorization") String accetoken,
  //   @Field("token") String token,
  //   @Field("amount") int amount,
  //   @Field("subscription_plan_id") String subsId,
  //   @Field("date_time") int dateTime,
  //   @Field("duration") int duration,
  //   @Field("sessoin_per_week") int sessionCount,
  // );

  // /// place subscription order
  // @POST("payment/checkout-with-rozorpay")
  // @FormUrlEncoded()
  // Future<OrderModel> checkoutOrder(
  //   @Header("Authorization") String accetoken,
  //   @Field("token") String token,
  //   @Field("amount") int amount,
  //   @Field("order_id") String orderid,
  //   @Field("payment_data") String paymentData,
  // );

}
