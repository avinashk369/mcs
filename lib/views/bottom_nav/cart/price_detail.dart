import 'package:flutter/material.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/product_utility.dart';
import 'package:mcs/utils/utils.dart';

class PriceDetail extends StatelessWidget {
  const PriceDetail({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    double total = ProductUtility.calculatePrice(products);
    double totalPrice = ProductUtility.calculateActualPrice(products);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Price details",
            style: kLabelStyleBold.copyWith(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MRP(${products.length} items)",
                style: kLabelStyle,
              ),
              Text("₹$totalPrice", style: kLabelStyle),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product discount",
                style: kLabelStyle,
              ),
              Text(
                "-₹${totalPrice - total}",
                style: kLabelStyle.copyWith(color: greenColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery fee",
                style: kLabelStyle,
              ),
              Text(
                "Free",
                style: kLabelStyle.copyWith(color: greenColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: kLabelStyleBold,
              ),
              Text(
                "₹$total",
                style: kLabelStyleBold.copyWith(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        // Text(
        //   "You will save ₹$saved on this order",
        //   style: kLabelStyleBold.copyWith(color: greenColor),
        // ),
      ],
    );
  }
}
