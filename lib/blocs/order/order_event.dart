part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.placeOrder({required Map<String, dynamic> data}) =
      PlaceOrder;
  const factory OrderEvent.loadOrder({required Map<String, dynamic> data}) =
      LoadOrder;
  const factory OrderEvent.orderDetail({required Map<String, dynamic> data}) =
      OrderDetail;
}
