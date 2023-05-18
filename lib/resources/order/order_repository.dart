import 'package:mcs/models/order/order_model.dart';

import '../../models/base_response.dart';
import '../../models/product/product_mode.dart';

abstract class OrderRepository {
  Future<BaseResponse<List<OrderModel>>> loadOrders(Map<String, dynamic> data);
  Future<BaseResponse<OrderModel>> placeOrders(Map<String, dynamic> data);
  Future<BaseResponse<List<ProductModel>>> orderDetail(
      Map<String, dynamic> data);
}
