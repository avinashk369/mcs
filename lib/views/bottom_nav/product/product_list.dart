library product_list;

import 'package:flutter/material.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
import 'package:mcs/views/bottom_nav/subcategory/subcat_list.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: kToolbarHeight,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  children: const [
                    CustomAppBar(
                      title: 'Products',
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SubCatList(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          loadProducts(),
        ],
      ),
    );
  }

  Widget loadProducts() => SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductCard(
              productModel: ProductModel(),
              height: 220,
              addToCart: (_) {},
              offer: "",
              width: double.infinity,
            );
          },
          childCount: 9,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 1,
          childAspectRatio: .75,
        ),
      );
}
