part of home_screen;

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.height,
    required this.width,
    this.hasOffer = false,
    required this.offer,
    required this.addToCart,
    required this.productModel,
    required this.deleteFromCart,
    this.showAddOn,
  }) : super(key: key);
  final double height;
  final double width;
  final bool? hasOffer;
  final String offer;
  final ProductModel productModel;
  final Function(ProductModel product) addToCart;
  final Function(ProductModel product) deleteFromCart;
  Function(ProductModel product, ProductState state)? showAddOn;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final state = context.watch<ProductBloc>().state;

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
                        imageUrl: productModel.productImage ?? '',
                        placeholder: (context, url) =>
                            Image.asset("assets/images/logo.png"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/logo.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(productModel.brand!,
                        //     style: kLabelStyle.copyWith(
                        //         fontSize: 11, color: Colors.grey[400])),
                        Text(
                          productModel.name!,
                          maxLines: 2,
                          style: kLabelStyleBold,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 25,
                          child: variantCard(
                            productModel.variant!.length > 1,
                            productModel.variant![productModel.index],
                            onTap: () => showAddOn!(productModel, state),
                          ),
                        ),

                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "₹${productModel.variant![productModel.index].discount.toString()}",
                                  style: kLabelStyleBold.copyWith(
                                    fontSize: 18,
                                  )),
                              TextSpan(
                                  text: " ", style: kLabelStyleBold.copyWith()),
                              TextSpan(
                                  text:
                                      "₹${productModel.variant![productModel.index].price.toString()}",
                                  style: kLabelStyleBold.copyWith(
                                      fontSize: 12,
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
                    ).horizontalPadding(5).verticalPadding(5),
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
      );
    });
  }

  Widget variantCard(bool isShow, Variant variant,
          {required Function() onTap}) =>
      InkWell(
        onTap: isShow ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: greyColor.withOpacity(.4)),
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${variant.unitName}-${variant.unit}",
                style: kLabelStyleBold.copyWith(),
              ).horizontalPadding(5),
              const SizedBox(width: 10),
              isShow
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: greyColor.withOpacity(.4)),
                        ),
                        color: greyColor.withOpacity(.2),
                      ),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        color: primaryLight,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      );
}
