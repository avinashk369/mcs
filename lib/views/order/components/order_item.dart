part of order_detail_screen;

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductCard(productModel: productModel),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(productModel.name!, style: kLabelStyle),
                const Spacer(),
                Text(
                  "${productModel.unit!} x ${productModel.quantity!}",
                  style: kLabelStyle.copyWith(color: greyColor),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "$rupees${productModel.price!}",
            style: kLabelStyleBold.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
