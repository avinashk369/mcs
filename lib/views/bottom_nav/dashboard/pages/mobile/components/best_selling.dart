part of home_screen;

class BestSelling extends StatelessWidget {
  BestSelling({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    int listSize = products.length;
    int itemCount = 2;

    return BlocBuilder<NavigationBloc, int>(builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .75,
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(width: 0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: listSize ~/ itemCount,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ItemCard(
                  product: products[(listSize ~/ itemCount) * 0 + index],
                  height: MediaQuery.of(context).size.height * .37,
                  addToCart: (product) {
                    context
                        .read<ProductBloc>()
                        .add(AddProduct(productModel: product, isCart: false));
                  },
                  removeFromCart: (product) {
                    context.read<ProductBloc>().add(RemoveProduct(product));
                  },
                ),
                ItemCard(
                  product: products[(listSize ~/ itemCount) * 1 + index],
                  height: MediaQuery.of(context).size.height * .37,
                  addToCart: (product) {
                    context
                        .read<ProductBloc>()
                        .add(AddProduct(productModel: product, isCart: false));
                  },
                  removeFromCart: (product) {
                    context.read<ProductBloc>().add(RemoveProduct(product));
                  },
                )
              ],
            );
          },
        ),
      );
    });
  }
}
