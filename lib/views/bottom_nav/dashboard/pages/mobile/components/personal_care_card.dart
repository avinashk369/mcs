part of home_screen;

class PersonalCareCard extends StatelessWidget {
  const PersonalCareCard(
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
    return SizedBox(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3)),
                  child: SizedBox(
                    height: height,
                    width: 120,
                    child: CachedNetworkImage(
                      imageUrl: productModel.productImage ?? '',
                      placeholder: (context, url) =>
                          Image.asset("assets/images/photo.jpg"),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/photo.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ).verticalPadding(5).horizontalPadding(5),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productModel.name!,
                        style: kLabelStyleBold,
                      ),
                      Text(
                        "size - 1Kg",
                        style: kLabelStyleBold,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            // TextSpan(
                            //     text: "₹${productModel.offerPrice.toString()}",
                            //     style: kLabelStyleBold.copyWith(
                            //       fontSize: 12,
                            //     )),
                            // TextSpan(
                            //     text: "₹${productModel.price!.toString()}",
                            //     style: kLabelStyleBold.copyWith(
                            //         fontSize: 10,
                            //         color: greyColor,
                            //         decoration: TextDecoration.lineThrough)),
                          ])),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => addToCart("avinash"),
                            icon: const Icon(
                              Icons.shopping_cart,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
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
    );
  }
}
