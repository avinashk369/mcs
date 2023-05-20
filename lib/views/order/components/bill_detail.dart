part of order_detail_screen;

class BillDetail extends StatelessWidget {
  const BillDetail(
      {super.key, required this.orderModel, required this.products});
  final OrderModel orderModel;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: secondaryLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Text(
            "Bill Detail",
            style: kLabelStyleBold.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("MRP", style: kLabelStyle),
              Text(
                rupees +
                    ProductUtility.calculateOriginalOrderItemPrice(products)
                        .toString(),
                style: kLabelStyleBold,
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discount",
                  style: kLabelStyle.copyWith(color: primaryLight)),
              Text(
                rupees +
                    (ProductUtility.calculateOriginalOrderItemPrice(products) -
                            ProductUtility.calculateOrderItemPrice(products))
                        .toStringAsFixed(2),
                style: kLabelStyleBold.copyWith(color: primaryLight),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Deilvery Chg", style: kLabelStyle),
              Text(
                rupees + orderModel.shippingCharge!,
                style: kLabelStyleBold,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: kLabelStyleBold),
              Text(
                rupees +
                    (double.tryParse(orderModel.shippingCharge!)! +
                            ProductUtility.calculateOrderItemPrice(products))
                        .toStringAsFixed(2),
                style: kLabelStyleBold,
              ),
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
