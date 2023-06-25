import 'package:mcs/models/models.dart'
    show BaseResponse, RestaurantModel, ProductModel;

abstract class RestaurantRepository {
  Future<BaseResponse<List<RestaurantModel>>> loadRestaurants(
      Map<String, dynamic> request);
  Future<BaseResponse<List<ProductModel>>> loadProducts(
      Map<String, dynamic> data);
  Future<BaseResponse<List<ProductModel>>> searchProduct(
      Map<String, dynamic> data);
}
