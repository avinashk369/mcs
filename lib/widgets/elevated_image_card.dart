import 'package:flutter/material.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/utils/utils.dart';

class ElevatedImageCard extends StatelessWidget {
  const ElevatedImageCard(
      {Key? key,
      required this.cardRadius,
      required this.imagePath,
      required this.size,
      required this.elevattion,
      required this.merchantModel})
      : super(key: key);
  final double cardRadius;
  final String imagePath;
  final double size;
  final double elevattion;
  final MerchantModel merchantModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          inr + "${merchantModel.hrRate}",
          style: kLabelStyleBold.copyWith(fontSize: 18),
        ),
        Text(
          "Per hour",
          style: kLabelStyleBold.copyWith(
            fontSize: 12,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
