import 'package:mcs/models/product/product_mode.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> loadProducts();
  Future<List<ProductModel>> loadPersonalCare();
  Future<List<ProductModel>> loadDailyNeeds();
  Future<List<ProductModel>> loadDairyProducts();
}
