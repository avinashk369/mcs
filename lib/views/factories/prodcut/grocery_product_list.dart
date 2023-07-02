part of product_list_interface;

class GroceryProductList implements ProductListInterface {
  @override
  Widget build({
    required Function(ProductModel productModel) addToCart,
    required Function(ProductModel productModel) removeFromCart,
    Function(ProductModel productModel, ProductState state)? showAddOn,
    required List<ProductModel> products,
  }) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductCard(
            productModel: products[index],
            height: MediaQuery.of(context).size.height * .26,
            addToCart: (product) => addToCart(product),
            deleteFromCart: (product) => removeFromCart(product),
            offer: "",
            width: double.infinity,
            showAddOn: (product, state) => showAddOn!(product, state),
          );
        },
        childCount: products.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 1,
        childAspectRatio: .65,
      ),
    );
  }
}
