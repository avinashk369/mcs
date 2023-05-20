import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/models.dart';

import '../../models/order/order_model.dart';
import '../../resources/order/order_repository.dart';
part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  OrderBloc(this._orderRepository) : super(const OrderIntializing()) {
    on<OrderEvent>(
      (event, emit) async {
        await event.map(
          placeOrder: (event) async => await _placeOrder(event, emit),
          loadOrder: (event) async => await _loadOrders(event, emit),
          orderDetail: (event) async => await _orderDetail(event, emit),
          expandList: (event) async => await _expandList(event, emit),
        );
      },
    );
  }

  Future _expandList(ExpandList event, Emitter<OrderState> emit) async {
    emit(ExpandedList(isExapnded: !event.isExpanded));
  }

  Future _placeOrder(PlaceOrder event, Emitter<OrderState> emit) async {
    try {
      emit(const OrderLoading());
      BaseResponse<OrderModel> order =
          await _orderRepository.placeOrders(event.data);
      emit(order.status!
          ? OrderPlaced(message: order.message!)
          : OrderError(message: order.message!));
    } on ServerError catch (error) {
      emit(OrderError(message: error.errorMessage));
    } catch (e) {
      emit(OrderError(message: e.toString()));
    }
  }

  Future _loadOrders(LoadOrder event, Emitter<OrderState> emit) async {
    try {
      emit(const OrderLoading());
      BaseResponse<List<OrderModel>> orders =
          await _orderRepository.loadOrders(event.data);

      emit(orders.status!
          ? OrderLoaded(order: orders.data!)
          : OrderError(message: orders.message!));
    } on ServerError catch (error) {
      emit(OrderError(message: error.errorMessage));
    } catch (e) {
      emit(OrderError(message: e.toString()));
    }
  }

  Future _orderDetail(OrderDetail event, Emitter<OrderState> emit) async {
    try {
      emit(const OrderLoading());

      BaseResponse<List<ProductModel>> products =
          await _orderRepository.orderDetail(event.data);
      emit(products.status!
          ? OrderDetailLoaded(
              products: products.data!, subTotal: products.subTotal!)
          : OrderError(message: products.message!));
    } on ServerError catch (error) {
      emit(OrderError(message: error.errorMessage));
    } catch (e) {
      emit(OrderError(message: e.toString()));
    }
  }
}
