part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = OrderIntializing;
  const factory OrderState.loading() = OrderLoading;
  const factory OrderState.orderLoaded({required List<OrderModel> order}) =
      OrderLoaded;
  const factory OrderState.error({required String message}) = OrderError;
  const factory OrderState.orderPlaced(
      {OrderModel? orderModel, String? message}) = OrderPlaced;
  const factory OrderState.orderDetail({required OrderModel orderModel}) =
      OrderDetailLoaded;
}
