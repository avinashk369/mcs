part of home_screen;

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.height,
      required this.product,
      required this.addToCart,
      required this.removeFromCart})
      : super(key: key);
  final double height;
  final ProductModel product;
  final Function(ProductModel product) addToCart;
  final Function(ProductModel product) removeFromCart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.height * .23,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: Stack(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: product.thumbnail!,
                        placeholder: (context, url) =>
                            Image.asset("assets/images/photo.jpg"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/photo.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Text(
                    product.name!,
                    style: kLabelStyleBold,
                  ).horizontalPadding(5),
                  Text(
                    "size - 1Kg",
                    style: kLabelStyleBold,
                  ).horizontalPadding(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: RichText(
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
                      ),
                      Chip(
                        backgroundColor: redColor.withOpacity(.1),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        label: SizedBox(
                          width: 70,
                          child: BlocBuilder<ProductBloc, ProductState>(
                            builder: ((context, state) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      removeFromCart(product.copyWith(
                                          count: product.count > 1
                                              ? product.count - 1
                                              : 0));
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    child: FittedBox(
                                      child: Text(
                                        product.count.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ).horizontalPadding(3),
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () => addToCart(product.copyWith(
                                        count: product.count + 1)),
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ).horizontalPadding(5),
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
      ),
    );
  }
}
