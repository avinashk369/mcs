import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/server_error.dart';
import '../../models/base_response.dart';
import '../../models/coupon/shipping_model.dart';
import '../../models/coupon/coupon_model.dart';
import '../../resources/cart/cart_repository.dart';
part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepositoryImpl;

  CartBloc({required this.cartRepositoryImpl})
      : super(const CartState.initial()) {
    on<CartEvent>(
      (event, emit) async {
        await event.map(
          applyCoupon: (event) async => await _applyCoupon(event, emit),
          validateCoupon: (event) async => await _validate(event, emit),
          loadShippingCharge: (event) async =>
              await _loadShippingCharge(event, emit),
        );
      },
    );
  }

  Future _loadShippingCharge(
      LoadShippingCharge event, Emitter<CartState> emit) async {
    try {
      emit(const CartLoading());
      emit(ShippingChargeLoaded(
          shippingModel:
              await cartRepositoryImpl.getShippingCharge(event.data)));
    } on ServerError catch (error) {
      emit(CartError(message: error.errorMessage));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future _validate(ValidateCoupon event, Emitter<CartState> emit) async {
    try {
      emit(ValidCoupon(
          isValid: event.couponCode.isNotEmpty && event.couponCode.length > 5));
    } catch (_) {}
  }

  Future _applyCoupon(ApplyCoupon event, Emitter<CartState> emit) async {
    try {
      emit(const CartLoading());
      BaseResponse<CouponModel> response = await cartRepositoryImpl.applyCoupon(
          couponCode: event.couponCode,
          userId: event.userId,
          subTotal: event.subTotal);
      //if(response.status)
      emit(response.status!
          ? CouponApplied(couponModel: response.data!)
          : CartError(message: response.message!));
    } on ServerError catch (error) {
      emit(CartError(message: error.errorMessage));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
