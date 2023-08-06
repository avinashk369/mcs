import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/storage/hive_service.dart';
import 'package:mcs/utils/product_dialog_util.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
import 'package:mcs/views/factories/prodcut/product_list_interface.dart';
import 'package:mcs/views/factories/prodcut/product_type_enums.dart';

import '../../../../utils/app_constants.dart';
import '../../../../utils/preference_utils.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ProductFactory.buildList(
      productType: ProductType.grocery,
      products: products,
      addToCart: (product) {
        /// add products into pref for local storage
        PreferenceUtils.clearCart(cartItems)!.then((value) => {
              PreferenceUtils.putString(
                  cartItems, product.copyWith(count: 1).toJson().toString())
            });
        HiveService.addToCart(
            product.copyWith(count: 1), PreferenceUtils.getString(user_uid));
        context.read<ProductBloc>().add(AddProduct(
            productModel: product.copyWith(count: 1), isCart: false));
      },
      removeFromCart: (product) {
        /// remove product from pref
        PreferenceUtils.clearCart(cartItems);
        context.read<ProductBloc>().add(DeleteProduct(product));
      },
      showAddOn: (productModel, state) =>
          ProductDialogUtil.showVariantBottomSheet(
        context: context,
        variants: productModel.variant!,
        state: state,
        productModel: productModel,
        addToCart: (productModel, index) {
          context.read<ProductBloc>().add(
              UpdatePrice(productModel: productModel.copyWith(index: index)));
          if (state is ProductLoaded) {
            context.read<ProductBloc>().add(AddProduct(
                productModel: productModel.copyWith(index: index, count: 1),
                isCart: false));
          }
          Navigator.of(context).pop();
        },
      ),
    );
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductCard(
            productModel: products[index],
            height: 225,
            addToCart: (product) {
              /// add products into pref for local storage
              PreferenceUtils.clearCart(cartItems)!.then((value) => {
                    PreferenceUtils.putString(cartItems,
                        product.copyWith(count: 1).toJson().toString())
                  });

              context.read<ProductBloc>().add(AddProduct(
                  productModel: product.copyWith(count: 1), isCart: false));
            },
            deleteFromCart: (product) {
              /// remove product from pref
              PreferenceUtils.clearCart(cartItems);
              context.read<ProductBloc>().add(DeleteProduct(product));
            },
            offer: "",
            width: double.infinity,
          );
        },
        childCount: products.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 1,
        childAspectRatio: .7,
      ),
    );
  }
}
