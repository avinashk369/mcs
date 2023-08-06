import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/styles.dart';
import 'package:mcs/utils/utils.dart';

class AddRemove extends StatelessWidget {
  const AddRemove(
      {super.key,
      required this.addProduct,
      required this.removeProduct,
      required this.productModel});
  final Function(ProductModel productModel) addProduct;
  final Function(ProductModel productModel) removeProduct;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //border: Border.all(),
        borderRadius: BorderRadius.circular(4),
        color: productModel.count < 2 ? redColor : secondaryLight,
      ),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          productModel.count < 2
              ? IconButton(
                  onPressed: () {
                    removeProduct(productModel.copyWith(count: 0));
                    //deleteFromCart(productModel);
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: secondaryLight,
                    size: 16,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(maxWidth: 20),
                )
              : IconButton(
                  onPressed: () {
                    removeProduct(productModel.copyWith(
                        count: productModel.count > 1
                            ? productModel.count - 1
                            : 0));
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 16,
                    color: secondaryLight,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(maxWidth: 20),
                ),
          SizedBox(
            width: 30,
            child: Text(
              productModel.count.toString(),
              textAlign: TextAlign.center,
              style: kLabelStyleBold.copyWith(
                fontSize: 14,
                color: secondaryLight,
              ),
            ),
          ),
          IconButton(
            onPressed: int.parse(
                        productModel.variant![productModel.index].maxQty!) <
                    productModel.count
                ? () => Fluttertoast.showToast(
                    msg:
                        "Sorry! You have reached max ${productModel.count} Qty.")
                : () => addProduct(
                    productModel.copyWith(count: productModel.count + 1)),
            icon: const Icon(
              Icons.add,
              size: 16,
              color: secondaryLight,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(maxWidth: 20),
          ),
        ],
      ),
    );
  }
}
