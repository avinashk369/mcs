part of home_screen;

class PersonalCare extends StatelessWidget {
  const PersonalCare({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => const SizedBox(
              width: 5,
            ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => PersonalCareCard(
              productModel: products[index],
              height: 150,
              width: double.infinity,
              offer: "5% Off",
              addToCart: (msg) {
                print(msg);
              },
            ),
        itemCount: products.length);
  }
}
