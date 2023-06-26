part of product_list_interface;

class FoodProductList implements ProductListInterface {
  @override
  Widget build({
    required Function(ProductModel productModel) addToCart,
    required Function(ProductModel productModel) removeFromCart,
    Function(ProductModel productModel, ProductState state)? showAddOn,
    required List<ProductModel> products,
  }) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => FoodCard(
              productModel: products[index],
              addToCart: (product) => addToCart(product),
              deleteFromCart: (product) => removeFromCart(product),
              showAddOn: (product, state) => showAddOn!(product, state),
            ),
        separatorBuilder: (_, __) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: DashedSeparator(color: greyColor),
            ),
        itemCount: products.length);
  }
}
