import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';

class NoProductError extends StatelessWidget {
  const NoProductError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/logo.png",
            cacheHeight: (kToolbarHeight * 3).toInt()),
        const SizedBox(height: 10),
        Text(
          "Sorry!!! We are not able to find the products",
          style: kLabelStyleBold.copyWith(fontSize: 18, color: greyColor),
        )
      ],
    ).horizontalPadding(20);
  }
}
