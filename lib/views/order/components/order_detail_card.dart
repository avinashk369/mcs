part of order_detail_screen;

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard(
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
            "Order Detail",
            style: kLabelStyleBold.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 12),
          Text("Order ID", style: kLabelStyle.copyWith(color: greyColor)),
          const SizedBox(height: 8),
          Text(
            "#${orderModel.orderId}",
            style: kLabelStyleBold.copyWith(),
          ),
          const SizedBox(height: 12),
          Text("Payment", style: kLabelStyle.copyWith(color: greyColor)),
          const SizedBox(height: 8),
          Text(
            orderModel.paymentType!,
            style: kLabelStyleBold.copyWith(),
          ),
          const SizedBox(height: 12),
          Text("Delivered to", style: kLabelStyle.copyWith(color: greyColor)),
          const SizedBox(height: 8),
          Text(
            orderModel.address!,
            style: kLabelStyleBold.copyWith(),
          ),
          const SizedBox(height: 12),
          Text("Order Placed", style: kLabelStyle.copyWith(color: greyColor)),
          const SizedBox(height: 8),
          Text(
            DateFormatter.dateToString(
                DateFormatter.stringToDate(orderModel.orderedAt!)),
            style: kLabelStyleBold.copyWith(),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
