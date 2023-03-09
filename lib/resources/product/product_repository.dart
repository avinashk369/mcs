import 'package:mcs/models/product/product_mode.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> loadProducts(Map<String, dynamic> data);
  Future<List<ProductModel>> loadPersonalCare();
  Future<List<ProductModel>> loadDailyNeeds();
  Future<List<ProductModel>> loadDairyProducts();
  Future<List<ProductModel>> searchProduct(Map<String, dynamic> data);
}
