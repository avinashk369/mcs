import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';

import '../../../blocs/product/productbloc.dart';

class ShoppingItem extends StatelessWidget {
  const ShoppingItem({
    Key? key,
    required this.productModel,
    required this.addToCart,
    required this.removeFromCart,
    required this.deleteFromCart,
  }) : super(key: key);
  final ProductModel productModel;
  final Function(ProductModel product) addToCart;
  final Function(ProductModel product) removeFromCart;
  final Function(ProductModel product) deleteFromCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              semanticContainer: true,
              color: secondaryLight,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(5), right: Radius.circular(0))),
              child: CachedNetworkImage(
                imageUrl: productModel.productImage ??
                    ' https://picsum.photos/250?image=9 ',
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/logo.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  productModel.name!,
                  style: kLabelStyleBold,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${productModel.variant![productModel.index].unitName}-${productModel.variant![productModel.index].unit}",
                  style: kLabelStyleBold.copyWith(color: greyColor),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: const [
                          // Text(
                          //   "₹${productModel.offerPrice.toString()}",
                          //   style: kLabelStyleBold.copyWith(fontSize: 16),
                          // ),
                          SizedBox(
                            width: 5,
                          ),
                          // Text(
                          //   "₹${productModel.price.toString()}",
                          //   style: kLabelStyleBold.copyWith(
                          //     decoration: TextDecoration.lineThrough,
                          //     fontSize: 10,
                          //     color: greyColor,
                          //   ),
                          // ),
                          SizedBox(
                            width: 5,
                          ),
                          // Text(
                          //   "₹${(productModel.price! - productModel.offerPrice!).toString()} Off",
                          //   style: kLabelStyleBold.copyWith(
                          //     fontSize: 12,
                          //     color: greenColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: ((context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: productModel.count < 2
                                    ? IconButton(
                                        onPressed: () {
                                          removeFromCart(
                                              productModel.copyWith(count: 0));
                                          deleteFromCart(productModel);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: redColor,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          removeFromCart(productModel.copyWith(
                                              count: productModel.count > 1
                                                  ? productModel.count - 1
                                                  : 0));
                                        },
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                      ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Text(
                                  productModel.count.toString(),
                                  textAlign: TextAlign.center,
                                  style: kLabelStyleBold.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: int.parse(productModel
                                              .variant![productModel.index]
                                              .maxQty!) <
                                          productModel.count
                                      ? () => Fluttertoast.showToast(
                                          msg:
                                              "Sorry! You have reached max ${productModel.count} Qty.")
                                      : () => addToCart(productModel.copyWith(
                                          count: productModel.count + 1)),
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
