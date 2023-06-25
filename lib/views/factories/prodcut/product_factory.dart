part of product_list_interface;

class ProductFactory {
  /// render list
  static Widget buildList({
    required ProductType productType,
    required Function(ProductModel product) addToCart,
    required Function(ProductModel product) removeFromCart,
    Function(ProductModel productModel, ProductState state)? showAddOn,
    required List<ProductModel> products,
  }) {
    return ProductListInterface(productType).build(
      addToCart: addToCart,
      removeFromCart: removeFromCart,
      products: products,
      showAddOn: showAddOn,
    );
  }

  /// render dialog i.e - add on or variant
}
