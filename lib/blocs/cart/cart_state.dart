part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartInitializing;
  const factory CartState.loading() = CartLoading;
  const factory CartState.error({required String message}) = CartError;
  const factory CartState.validCoupon({required bool isValid}) = ValidCoupon;
  const factory CartState.couponApplied({required CouponModel couponModel}) =
      CouponApplied;
  const factory CartState.shippingChargeLoaded(
      {required ShippingModel shippingModel}) = ShippingChargeLoaded;
}
