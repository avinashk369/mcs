import '../../models/models.dart' show CouponModel, ShippingModel, BaseResponse;

abstract class CartRepository {
  Future<BaseResponse<CouponModel>> applyCoupon(
      {required String userId,
      required String couponCode,
      required double subTotal});
  Future<ShippingModel> getShippingCharge(Map<String, dynamic> data);
}
