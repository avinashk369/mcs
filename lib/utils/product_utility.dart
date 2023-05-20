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

  /// calculate order item price
  static double calculateOrderItemPrice(List<ProductModel> products) {
    double total = 0.0;
    for (var element in products) {
      total += double.parse(element.price!) * int.tryParse(element.quantity!)!;
    }
    return total;
  }

  /// calculate original order item price
  static double calculateOriginalOrderItemPrice(List<ProductModel> products) {
    double total = 0.0;
    for (var element in products) {
      total += double.parse(element.originalPrice!) *
          int.tryParse(element.quantity!)!;
    }
    return total;
  }

  static int getCalculatedOffer(double part, double total) =>
      (((total - part) / total) * 100).toInt();

  static String perKgPrice(double price) => (price / 1000).toStringAsFixed(2);

  static String getProductQty(List<ProductModel> products) {
    // List<String> qty = [];
    // for (ProductModel product in products) {
    //   qty.add(product.count.toString());
    // }
    // return qty;
    String qty = "";
    for (ProductModel product in products) {
      qty += "${product.count},";
    }
    return qty.substring(0, qty.length - 1);
  }

  static String getProductIds(List<ProductModel> products) {
    // List<String> ids = [];
    // for (ProductModel product in products) {
    //   ids.add(product.productId.toString());
    // }
    // return ids;
    String ids = "";
    for (ProductModel product in products) {
      ids += "${product.productId},";
    }
    return ids.substring(0, ids.length - 1);
  }

  static String getProductPriceUnitIds(List<ProductModel> products) {
    // List<String> priceUnits = [];
    // for (ProductModel product in products) {
    //   priceUnits.add(product.variant![product.index].priceUnitId.toString());
    // }
    // return priceUnits;
    String priceUnits = "";
    for (ProductModel product in products) {
      priceUnits +=
          "${product.variant![product.index].priceUnitId.toString()},";
    }
    return priceUnits.substring(0, priceUnits.length - 1);
  }
}
