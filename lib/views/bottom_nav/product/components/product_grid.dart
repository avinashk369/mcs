import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductCard(
            productModel: products[index],
            height: 220,
            addToCart: (product) {
              context.read<ProductBloc>().add(AddProduct(
                  productModel: product.copyWith(count: 1), isCart: false));
            },
            deleteFromCart: (product) {
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
        childAspectRatio: .75,
      ),
    );
  }
}
