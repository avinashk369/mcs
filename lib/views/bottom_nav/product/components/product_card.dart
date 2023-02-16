part of home_screen;

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.height,
      required this.width,
      this.hasOffer = false,
      required this.offer,
      required this.addToCart,
      required this.productModel,
      required this.deleteFromCart})
      : super(key: key);
  final double height;
  final double width;
  final bool? hasOffer;
  final String offer;
  final ProductModel productModel;
  final Function(ProductModel product) addToCart;
  final Function(ProductModel product) deleteFromCart;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final state = context.watch<ProductBloc>().state;
      return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.of(context)
            .pushNamed(productDetail, arguments: productModel),
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
                        height: height * .8,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productModel.brand!,
                            style: kLabelStyle.copyWith(
                                fontSize: 11, color: Colors.grey[400])),
                        Text(
                          productModel.name!,
                          maxLines: 2,
                          style: kLabelStyleBold,
                        ),
                        Text(
                          "size - 1Kg",
                          style: kLabelStyleBold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "₹${productModel.offerPrice.toString()}",
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
                              onTap: () => (state is ProductLoaded) &&
                                      state.addedProducts!
                                          .contains(productModel)
                                  ? deleteFromCart(productModel)
                                  : addToCart(productModel),
                              child: (state is ProductLoaded) &&
                                      state.addedProducts!
                                          .contains(productModel)
                                  ? const Icon(
                                      Icons.delete,
                                      color: redColor,
                                    )
                                  : const Icon(
                                      Icons.shopping_cart,
                                      color: greenColor,
                                    ),
                            )
                          ],
                        ),
                        // RichText(
                        //   text: TextSpan(
                        //     children: [
                        //       TextSpan(
                        //         text: productModel.rating.toString(),
                        //         style: kLabelStyleBold,
                        //       ),
                        //       const WidgetSpan(
                        //         child: Icon(
                        //           Icons.star,
                        //           color: Colors.amber,
                        //           size: 10,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ).horizontalPadding(5),
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
                              style:
                                  kLabelStyle.copyWith(color: secondaryLight)),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
  }
}
