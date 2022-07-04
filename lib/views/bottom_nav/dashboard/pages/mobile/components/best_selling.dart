part of home_screen;

class BestSelling extends StatelessWidget {
  BestSelling({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<ProductModel> products;
  int itemCount = 2;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: .5);
  @override
  Widget build(BuildContext context) {
    int listSize = products.length;
    int itemCount = 2;
    int pageCount = (listSize / itemCount).ceil();
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
                  height: 245,
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
                  height: 245,
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

  Widget productItem(int index) => SizedBox(
        height: 200,
        width: 180,
        child: Stack(
          children: [
            Card(
              color: Colors.grey[50],
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)),
                    child: SizedBox(
                      height: 140,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: "https://picsum.photos/250?image=9",
                        placeholder: (context, url) =>
                            Image.asset("assets/images/photo.jpg"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/photo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "size - 1Kg",
                    style: kLabelStyleBold,
                  ),
                  Text("${index + 1}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "₹250",
                            style: kLabelStyleBold.copyWith(
                              fontSize: 12,
                            )),
                        TextSpan(
                            text: "₹300",
                            style: kLabelStyleBold.copyWith(
                                fontSize: 10,
                                color: greyColor,
                                decoration: TextDecoration.lineThrough)),
                      ])),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 20,
                decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3)),
                ),
                child: Center(
                  child: Text("10% Off",
                      style: kLabelStyle.copyWith(color: secondaryLight)),
                ),
              ),
            ),
          ],
        ),
      );
  Widget plateTable(List<ProductModel> products, int size, int itemCount) =>
      ListView.separated(
          addAutomaticKeepAlives: true,
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) =>
              ((size * itemCount) + 1 + index < products.length)
                  ? const SizedBox(
                      height: 2,
                    )
                  : const SizedBox.shrink(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            if ((size * itemCount) + index < products.length) {
              return ItemCard(
                product:
                    products[size > 0 ? (size * itemCount) + index : index],
                height: 245,
                addToCart: (product) {
                  context
                      .read<ProductBloc>()
                      .add(AddProduct(productModel: product, isCart: false));
                },
                removeFromCart: (product) {
                  context.read<ProductBloc>().add(RemoveProduct(product));
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          });
}
