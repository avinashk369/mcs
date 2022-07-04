part of home_screen;

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.height,
      required this.width,
      this.hasOffer = false,
      required this.offer,
      required this.addToCart,
      required this.productModel})
      : super(key: key);
  final double height;
  final double width;
  final bool? hasOffer;
  final String offer;
  final ProductModel productModel;
  final Function(String message) addToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => Navigator.of(context).pushNamed(productDetail),
      child: SizedBox(
        height: height,
        width: width,
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
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)),
                    child: SizedBox(
                      height: height * .7,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: productModel.thumbnail!,
                        placeholder: (context, url) =>
                            Image.asset("assets/images/photo.jpg"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/photo.jpg"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Text(
                      productModel.name!,
                      maxLines: 2,
                      style: kLabelStyleBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "size - 1Kg",
                      style: kLabelStyleBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "₹${productModel.offerPrice.toString()}",
                              style: kLabelStyleBold.copyWith(
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: " ",
                              style: kLabelStyleBold.copyWith(
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: "₹${productModel.price.toString()}",
                              style: kLabelStyleBold.copyWith(
                                  fontSize: 10,
                                  color: greyColor,
                                  decoration: TextDecoration.lineThrough)),
                        ])),
                        InkWell(
                          onTap: () => addToCart("avinash"),
                          child: const Icon(
                            Icons.shopping_cart,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: productModel.rating.toString(),
                            style: kLabelStyleBold,
                          ),
                          const WidgetSpan(
                            child: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            hasOffer!
                ? Positioned(
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
                        child: Text(offer,
                            style: kLabelStyle.copyWith(color: secondaryLight)),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
