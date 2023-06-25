import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/styles.dart';
import 'package:mcs/utils/theme_constants.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';

import '../models/product/variant.dart';
import 'product_utility.dart';

class ProductDialogUtil {
  static void showVariantBottomSheet({
    required BuildContext context,
    required List<Variant> variants,
    required ProductState state,
    required ProductModel productModel,
    required Function(ProductModel product, int index) addToCart,
  }) =>
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: kToolbarHeight,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(.08),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Choose an option', style: kLabelStyleBold),
                        const SizedBox(height: 8),
                        Text(
                          productModel.name!,
                          style: kLabelStyleBold.copyWith(
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: greyColor.withOpacity(.2),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: variants.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return variantItem(
                    variant: variants[index],
                    index: index,
                    onTap: (index) => addToCart(productModel, index),
                    isSelected: productModel.index == index,
                    productModel: productModel,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      );
  static Widget variantItem({
    required Function(int index) onTap,
    required Variant variant,
    required bool isSelected,
    required ProductModel productModel,
    required int index,
  }) =>
      ListTile(
        leading: SizedBox(
          height: kToolbarHeight,
          width: 120,
          child: CachedNetworkImage(
            imageUrl: productModel.productImage ?? '',
            placeholder: (context, url) =>
                Image.asset("assets/images/logo.png"),
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/logo.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        title: Text(
          "${variant.unitName}-${variant.unit}",
          style: kLabelStyle,
        ),
        subtitle: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "₹${productModel.variant![productModel.index].discount.toString()}",
                      style: kLabelStyleBold.copyWith(
                        fontSize: 18,
                      )),
                  TextSpan(text: " ", style: kLabelStyleBold.copyWith()),
                  TextSpan(
                      text:
                          "₹${productModel.variant![productModel.index].price.toString()}",
                      style: kLabelStyleBold.copyWith(
                          fontSize: 12,
                          color: greyColor,
                          decoration: TextDecoration.lineThrough)),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  color: primaryLight, borderRadius: BorderRadius.circular(2)),
              child: Text(
                "${ProductUtility.getCalculatedOffer(double.parse(productModel.variant![productModel.index].discount!), double.parse(productModel.variant![productModel.index].price!)).toString()}% Off",
                style: kLabelStyle.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text(),
            InkWell(
              onTap: () => onTap(index),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: greyColor.withOpacity(.4)),
                    borderRadius: BorderRadius.circular(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add",
                      style: kLabelStyleBold.copyWith(fontSize: 11),
                    ).horizontalPadding(5),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(color: greyColor.withOpacity(.4)),
                        ),
                        color: greyColor.withOpacity(.2),
                      ),
                      child: Icon(
                        Icons.add,
                        color: isSelected ? primaryLight : greyColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
