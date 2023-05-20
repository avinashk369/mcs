part of order_history;

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      required this.orderModel,
      required this.onTap,
      required this.repeatOrder});
  final OrderModel orderModel;
  final Function(OrderModel orderModel) onTap;
  final Function(OrderModel orderModel, List<ProductModel> products)
      repeatOrder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(orderModel),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: greyColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: statusColor(orderModel).withOpacity(.2),
                    ),
                    child: Center(
                      child: statusIcon(orderModel),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order ${orderModel.status!}",
                          style: kLabelStyleBold),
                      const SizedBox(height: 5),
                      Text(
                        "#${orderModel.orderId} - ${DateFormatter.dateToString(DateFormatter.stringToDate(orderModel.orderedAt!))}",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor.withOpacity(.8),
                  ),
                ],
              ),
            ),
            Divider(color: greyColor.withOpacity(.5)),

            /// product image list
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orderModel.productDetails!.length > 4
                        ? 5
                        : orderModel.productDetails!.length,
                    itemBuilder: ((context, index) => index > 3
                        ? Container(
                            width: (MediaQuery.of(context).size.width - 65) / 5,
                            decoration: BoxDecoration(
                              color: greyColor.withOpacity(.09),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "+${orderModel.productDetails!.length - 4}",
                                style: kLabelStyleBold.copyWith(
                                    fontSize: 20, color: greyColor),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: (MediaQuery.of(context).size.width - 65) / 5,
                            child: CachedNetworkImage(
                              imageUrl: orderModel
                                      .productDetails![index].productImage ??
                                  '',
                              placeholder: (context, url) =>
                                  Image.asset("assets/images/logo.png"),
                              errorWidget: (context, url, error) =>
                                  Image.asset("assets/images/logo.png"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    separatorBuilder: (_, __) => const SizedBox(width: 5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: greyColor.withOpacity(.5)),

            /// reorder action
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () =>
                  repeatOrder(orderModel, orderModel.productDetails!),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "Reorder",
                  style: kLabelStyleBold.copyWith(color: primaryLight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusIcon(OrderModel orderModel) {
    switch (orderModel.status) {
      case "Processing":
        return Icon(Icons.hourglass_bottom, color: statusColor(orderModel));
      case "Delivered":
        return Icon(Icons.check, color: statusColor(orderModel));
      default:
        return Icon(Icons.pending, color: statusColor(orderModel));
    }
  }

  Color statusColor(OrderModel orderModel) {
    switch (orderModel.status) {
      case "Processing":
        return Colors.orange;
      case "Delivered":
        return primaryLight;
      default:
        return primaryLight;
    }
  }
}
