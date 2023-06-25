part of food_screen;

class FoodCard extends StatelessWidget {
  const FoodCard(
      {Key? key, required this.productModel, required this.addToCart})
      : super(key: key);
  final ProductModel productModel;
  final Function(ProductModel product) addToCart;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .18,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: kLabelStyleBold.copyWith(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        //fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: [
                        TextSpan(
                            text: productModel.name,
                            style: kLabelStyle.copyWith(fontSize: 13))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "840  Cal| High protien ",
                    style: kLabelStyle.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "2 serving ",
                    style: kLabelStyle.copyWith(
                        // fontSize: 16,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\u{20B9}",
                              style: kLabelStyleBold.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: productModel
                                  .variant![productModel.index].discount,
                              style: kLabelStyleBold.copyWith(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                // fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\u{20B9}",
                              style: kLabelStyle.copyWith(
                                color: Colors.grey,
                                //fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: productModel
                                  .variant![productModel.index].price,
                              style: kLabelStyle.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                // fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * .18,
            width: size.width * .45,
            child: Stack(
              children: [
                Container(
                  width: size.width * .45,
                  height: size.height * .15,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[850],
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        productModel.productImage ?? "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  left: size.width * .1,
                  child: ElevatedButton(
                    onPressed: () => addToCart(productModel),
                    child: Row(
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(width: 10),
                        Text(
                          'ADD',
                          style: kLabelStyleBold.copyWith(
                            color: secondaryLight,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
