import 'package:mcs/models/coupon/coupon_model.dart';
import 'package:mcs/models/coupon/shipping_model.dart';
import 'package:mcs/models/server_error.dart';

import '../../models/base_response.dart';
import '../../services/ApiClient.dart';
import 'cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final ApiClient apiClient;

  CartRepositoryImpl({required this.apiClient});
  @override
  Future<BaseResponse<CouponModel>> applyCoupon(
      {required String userId,
      required String couponCode,
      required double subTotal}) async {
    late BaseResponse<CouponModel> baseResponse;
    try {
      baseResponse = (await apiClient.applyCoupon({
        "coupon_code": couponCode,
        "user_id": userId,
        "subtotal": subTotal
      }));
    } catch (e) {
      throw ServerError.withError(error: e);
    }
    return baseResponse;
  }

  @override
  Future<ShippingModel> getShippingCharge(Map<String, dynamic> data) async {
    late ShippingModel shippingModel;
    try {
      shippingModel = (await apiClient.getShippingCharge(data)).data!;
    } catch (e) {
      throw ServerError.withError(error: e);
    }
    return shippingModel;
  }
}
