import 'package:dio/dio.dart';
import 'package:mcs/models/models.dart'
    show
        CityModel,
        UserModel,
        PaymentModel,
        BaseResponse,
        BannerModel,
        SubCateModel,
        CategoryModel;
import 'package:mcs/models/payment/order.model.dart';
import 'package:mcs/models/payment/transfer.model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:retrofit/retrofit.dart';

import 'api_const.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: ApiConst.apiUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// get all city
  @GET(ApiConst.cityList)
  Future<BaseResponse<List<CityModel>>> getCityList();

  /// get all the banners by city id
  @POST(ApiConst.banners)
  @FormUrlEncoded()
  Future<BaseResponse<List<BannerModel>>> getBanners(
      @Body() Map<String, dynamic> data);

  /// get products based on city id and category id
  @POST(ApiConst.products)
  @FormUrlEncoded()
  Future<BaseResponse<List<ProductModel>>> getProducts(
      @Body() Map<String, dynamic> data);

  @GET("Home/HomeFeaturesData")
  Future<UserModel> getHomeFeatureData(
      @Header("Authorization") String accetoken);

  @POST(ApiConst.login)
  @FormUrlEncoded()
  Future<UserModel> userLogin(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.otpVerify)
  @FormUrlEncoded()
  Future<UserModel> otpVerificaiotn(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.resendOtp)
  @FormUrlEncoded()
  Future<UserModel> resendOtp(
    @Body() Map<String, dynamic> data,
  );
  @POST(ApiConst.getCategory)
  @FormUrlEncoded()
  Future<BaseResponse<List<CategoryModel>>> getCategories(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.getSubCategory)
  @FormUrlEncoded()
  Future<BaseResponse<List<SubCateModel>>> getSubCategories(
    @Body() Map<String, dynamic> data,
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
