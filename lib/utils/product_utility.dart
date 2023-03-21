import '../models/product/product_mode.dart';

class ProductUtility {
  static double calculatePrice(List<ProductModel> products) {
    return products.map((e) => e.variant).fold(
        0.0,
        (previousValue, element) =>
            (previousValue) + double.parse(element![0].price!));
  }
}
