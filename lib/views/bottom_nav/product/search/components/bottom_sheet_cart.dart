part of product_search_screen;

class BottomSheetCart extends StatelessWidget {
  const BottomSheetCart(
      {super.key, required this.products, required this.onTap});
  final List<ProductModel> products;
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
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price ${ProductUtility.calculatePrice(products)}',
              style:
                  kLabelStyleBold.copyWith(color: secondaryLight, fontSize: 14),
            ),
            Text(
              'Total items: ${products.length}',
              style: kLabelStyleBold.copyWith(color: secondaryLight),
            )
          ],
        ),
      ),
    );
  }
}
