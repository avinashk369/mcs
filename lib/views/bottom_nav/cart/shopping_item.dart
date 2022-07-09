import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Card(
      color: Colors.grey[50],
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
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
                  imageUrl: productModel.thumbnail ??
                      ' https://picsum.photos/250?image=9 ',
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
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
                  Text(productModel.price!.toString()),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: ((context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
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
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                  ),
                          ),
                          Flexible(
                            child: Text(
                              productModel.count.toString(),
                              style: kLabelStyleBold.copyWith(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () => addToCart(productModel.copyWith(
                                  count: productModel.count + 1)),
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
