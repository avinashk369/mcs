part of product_search_screen;

class BottomSheetCart extends StatelessWidget {
  const BottomSheetCart(
      {super.key, required this.productList, required this.onTap});
  final List<ProductModel> productList;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        height: kToolbarHeight - 10,
        decoration: const BoxDecoration(
            color: primaryLight,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    ListView.builder(
                      itemCount:
                          productList.length > 5 ? 5 : productList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 8,
                          height: double.infinity,
                          child: OverflowBox(
                            maxWidth: 40,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 1,
                              color: index ==
                                      (productList.length > 5
                                          ? 5
                                          : productList.length - 1)
                                  ? secondaryLight
                                  : secondaryLight.withOpacity(.3),
                              child: index ==
                                      (productList.length > 5
                                          ? 4
                                          : productList.length - 1)
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          productList[index].productImage ?? '',
                                      placeholder: (context, url) =>
                                          Image.asset("assets/images/logo.png"),
                                      errorWidget: (context, url, error) =>
                                          Image.asset("assets/images/logo.png"),
                                      fit: BoxFit.fill,
                                    )
                                  : Container(
                                      color: secondaryLight.withOpacity(.04),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${productList.length} items',
                          style: kLabelStyleBold.copyWith(
                              color: secondaryLight, fontSize: 14),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '₹${ProductUtility.calculatePrice(productList)}',
                                style: kLabelStyleBold.copyWith(
                                    color: secondaryLight, fontSize: 14),
                              ),
                              const WidgetSpan(
                                  child: SizedBox(
                                width: 4,
                              )),
                              TextSpan(
                                text:
                                    '₹${ProductUtility.calculateActualPrice(productList)}',
                                style: kLabelStyleBold.copyWith(
                                  color: secondaryLight,
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'View Cart',
                      style: kLabelStyleBold.copyWith(color: secondaryLight),
                    ),
                  )),
                  const WidgetSpan(
                    child: Icon(
                      Icons.arrow_right,
                      size: 22,
                      color: secondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
