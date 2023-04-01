import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';

import 'shopping_item.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({Key? key, required this.addedProducts}) : super(key: key);
  final List<ProductModel> addedProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(indent: 5, endIndent: 5),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addedProducts.length,
      itemBuilder: (context, index) => Column(
        children: [
          ShoppingItem(
            productModel: addedProducts[index],
            addToCart: (product) {
              /// add product into pref for local storage
              PreferenceUtils.clearCart(cartItems)!.then((value) => {
                    PreferenceUtils.putString(
                        cartItems, product.toJson().toString())
                  });

              context.read<ProductBloc>().add(
                  ProductEvent.addProduct(productModel: product, isCart: true));
            },
            removeFromCart: (product) {
              /// update product into pref
              PreferenceUtils.clearCart(cartItems)!.then((value) => {
                    PreferenceUtils.putString(
                        cartItems, product.toJson().toString())
                  });
              context.read<ProductBloc>().add(RemoveProduct(product));
            },
            deleteFromCart: (product) {
              /// delete prod from pref
              PreferenceUtils.clearCart(cartItems);
              context.read<ProductBloc>().add(DeleteProduct(product));
            },
          ),
        ],
      ),
    );
  }
}
