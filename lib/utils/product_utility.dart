import '../models/product/product_mode.dart';

class ProductUtility {
  /// calculate the product price from the list
  static double calculatePrice(List<ProductModel> products) {
    double total = 0.0;
    for (var element in products) {
      total += double.parse(element.variant![element.index].discount!) *
          element.count;
    }
    return total;
    // return products.map((e) => e.variant).fold(
    //     0.0,
    //     (previousValue, element) =>
    //         (previousValue) + double.parse(element![0].price!));
  }

  /// calculate actual price
  static double calculateActualPrice(List<ProductModel> products) {
    double total = 0.0;
    for (var element in products) {
      total +=
          double.parse(element.variant![element.index].price!) * element.count;
    }
    return total;
  }

  static int getCalculatedOffer(double part, double total) =>
      (((total - part) / total) * 100).toInt();

  static String perKgPrice(double price) => (price / 1000).toStringAsFixed(2);
}
