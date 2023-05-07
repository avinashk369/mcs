import 'package:mcs/models/models.dart';
import 'package:mcs/models/order/order_model.dart';
import '../../services/ApiClient.dart';
import 'order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  final ApiClient apiClient;

  OrderRepositoryImpl({required this.apiClient});

  @override
  Future<BaseResponse<List<OrderModel>>> loadOrders(
      Map<String, dynamic> data) async {
    late BaseResponse<List<OrderModel>> orderModels;
    try {
      orderModels = await apiClient.loadOrder(data);
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return orderModels;
  }

  @override
  Future<BaseResponse<OrderModel>> placeOrders(
      Map<String, dynamic> data) async {
    late BaseResponse<OrderModel> orderModel;
    try {
      orderModel = await apiClient.placeOrder(data);
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return orderModel;
  }

  @override
  Future<BaseResponse<OrderModel>> orderDetail(
      Map<String, dynamic> data) async {
    late BaseResponse<OrderModel> orderModel;
    try {
      orderModel = await apiClient.orderDetail(data);
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return orderModel;
  }
}
