part of home_screen;

class DairyBakery extends StatelessWidget {
  const DairyBakery({Key? key, required this.height, required this.products})
      : super(key: key);
  final double height;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
          addAutomaticKeepAlives: true,
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => ProductCard(
                productModel: products[index],
                height: 220,
                width: 180,
                hasOffer: true,
                offer: "5% Off",
                addToCart: (msg) {
                  print(msg);
                },
                deleteFromCart: (product) {
                  context.read<ProductBloc>().add(RemoveProduct(product));
                },
              ),
          itemCount: products.length),
    );
  }
}
