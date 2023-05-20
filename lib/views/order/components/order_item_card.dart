part of order_detail_screen;

class OrderItemCard extends StatelessWidget {
  const OrderItemCard(
      {super.key, required this.orderModel, required this.products});
  final OrderModel orderModel;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrderBloc>().state;
    final isExpanded = (state is ExpandedList) ? state.isExapnded : false;
    return Container(
      color: secondaryLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text("${orderModel.totalItem.toString()} Items in this order",
              style: kLabelStyleBold.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isExpanded
                  ? products.length
                  : products.length > 3
                      ? 3
                      : products.length,
              itemBuilder: (_, index) =>
                  OrderItem(productModel: products[index])),
          products.length > 3
              ? Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {
                      context
                          .read<OrderBloc>()
                          .add(ExpandList(isExpanded: isExpanded));
                    },
                    child: Text(
                      "Show ${isExpanded ? "Less" : "More"}",
                      style: kLabelStyleBold.copyWith(color: primaryLight),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ).horizontalPadding(10),
    );
  }
}
