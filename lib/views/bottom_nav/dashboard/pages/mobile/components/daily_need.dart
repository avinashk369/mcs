part of home_screen;

class DailyNeed extends StatelessWidget {
  const DailyNeed({Key? key, required this.height, required this.products})
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
                width: 150,
                hasOffer: true,
                offer: "5% Off",
                addToCart: (msg) {
                  print(msg);
                },
              ),
          itemCount: products.length),
    );
  }
}
