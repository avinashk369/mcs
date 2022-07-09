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
      width: MediaQuery.of(context).size.height * .3,
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
                      height: 150,
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
                  ),
                  Text(
                    "size - 1Kg",
                    style: kLabelStyleBold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
                      const SizedBox(),
                      Expanded(
                        child: BlocBuilder<ProductBloc, ProductState>(
                          builder: ((context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: IconButton(
                                    onPressed: () {
                                      removeFromCart(product.copyWith(
                                          count: product.count > 1
                                              ? product.count - 1
                                              : 0));
                                    },
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    product.count.toString(),
                                    style: kLabelStyleBold.copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: IconButton(
                                    onPressed: () => addToCart(product.copyWith(
                                        count: product.count + 1)),
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
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
      ),
    );
  }
}
