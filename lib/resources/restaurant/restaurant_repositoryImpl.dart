import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/services/ApiClient.dart';

import '../../models/models.dart'
    show BaseResponse, RestaurantModel, ServerError;
import 'restaurnat_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final ApiClient apiClient;

  RestaurantRepositoryImpl({required this.apiClient});
  @override
  Future<BaseResponse<List<RestaurantModel>>> loadRestaurants(
      Map<String, dynamic> request) async {
    late BaseResponse<List<RestaurantModel>> restaurants;
    try {
      restaurants = await apiClient.loadRestaurants(request);
    } catch (error, _) {
      throw ServerError.withError(error: error);
    }
    return restaurants;
  }

  @override
  Future<BaseResponse<List<ProductModel>>> loadProducts(
      Map<String, dynamic> data) async {
    late BaseResponse<List<ProductModel>> products;
    try {
      products = await apiClient.getProducts(data);
    } catch (error, stackTrace) {
      print(stackTrace.toString());
      throw ServerError.withError(error: error);
    }
    return products;
  }

  @override
  Future<BaseResponse<List<ProductModel>>> searchProduct(
      Map<String, dynamic> data) async {
    late BaseResponse<List<ProductModel>> products;
    try {
      products = await apiClient.searchProducts(data);
    } catch (e) {
      throw ServerError.withError(error: e);
    }
    return products;
  }
}
