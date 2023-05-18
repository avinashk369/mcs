import 'package:dio/dio.dart';
import 'package:mcs/models/models.dart'
    show
        CityModel,
        UserModel,
        BaseResponse,
        BannerModel,
        SubCateModel,
        CouponModel,
        UserAddress,
        ShippingModel,
        CategoryModel;
import 'package:mcs/models/order/order_model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user/auth_model.dart';
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

  @POST(ApiConst.searchProducts)
  @FormUrlEncoded()
  Future<BaseResponse<List<ProductModel>>> searchProducts(
      @Body() Map<String, dynamic> data);

  @POST(ApiConst.login)
  @FormUrlEncoded()
  Future<AuthModel> userLogin(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.otpVerify)
  @FormUrlEncoded()
  Future<BaseResponse<UserModel>> otpVerificaiotn(
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

  @POST(ApiConst.saveAddress)
  @FormUrlEncoded()
  Future<BaseResponse<UserModel>> saveUserAddress(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.userRegisteration)
  @FormUrlEncoded()
  Future<BaseResponse<UserModel>> registerUser(@Body() UserModel userModel);

  @POST(ApiConst.applyCoupon)
  @FormUrlEncoded()
  Future<BaseResponse<CouponModel>> applyCoupon(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.shippingCharge)
  @FormUrlEncoded()
  Future<BaseResponse<ShippingModel>> getShippingCharge(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.placeOrder)
  @FormUrlEncoded()
  Future<BaseResponse<OrderModel>> placeOrder(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.loadOrder)
  @FormUrlEncoded()
  Future<BaseResponse<List<OrderModel>>> loadOrder(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.orderDetail)
  @FormUrlEncoded()
  Future<BaseResponse<List<ProductModel>>> orderDetail(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConst.userAddress)
  @FormUrlEncoded()
  Future<BaseResponse<List<UserAddress>>> userAddress(
    @Body() Map<String, dynamic> data,
  );
}
