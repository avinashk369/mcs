part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.validateCoupon({required String couponCode}) =
      ValidateCoupon;
  const factory CartEvent.applyCoupon(
      {required String couponCode,
      required String userId,
      required double subTotal}) = ApplyCoupon;
  const factory CartEvent.loadShippingCharge(
      {required Map<String, dynamic> data}) = LoadShippingCharge;
}
