import 'package:flutter/material.dart';
import 'package:mcs/models/product/variant.dart';
import 'package:mcs/utils/styles.dart';
import 'package:mcs/utils/theme_constants.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';

class VariantCard extends StatelessWidget {
  const VariantCard(
      {super.key,
      required this.isShow,
      required this.variant,
      required this.onTap});
  final bool isShow;
  final Variant variant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isShow ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: greyColor.withOpacity(.4)),
            borderRadius: BorderRadius.circular(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${variant.unitName}-${variant.unit}",
              style: kLabelStyleBold.copyWith(),
            ).horizontalPadding(5),
            const SizedBox(width: 10),
            isShow
                ? Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: greyColor.withOpacity(.4)),
                      ),
                      color: greyColor.withOpacity(.2),
                    ),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: primaryLight,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
