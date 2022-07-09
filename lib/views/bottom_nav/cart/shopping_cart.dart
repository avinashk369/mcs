import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/blocs/user/user_bloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/widgets/loading_ui.dart';

import 'shopping_item.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(context.read<UserRepositoryImpl>()),
        ),
      ],
      child: Scaffold(
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
                        title: 'Cart',
                      ),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                    return state.maybeMap(
                      initial: (_) => LoadingUI(),
                      loaded: (res) => renderProducts(res.addedProducts!),
                      error: (err) => Text(err.message),
                      orElse: () => const SizedBox.shrink(),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderProducts(List<ProductModel> addedProducts) => ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: addedProducts.length,
        itemBuilder: (context, index) => Column(
          children: [
            ShoppingItem(
              productModel: addedProducts[index],
              addToCart: (product) {
                context.read<ProductBloc>().add(ProductEvent.addProduct(
                    productModel: product, isCart: true));
              },
              removeFromCart: (product) {
                context.read<ProductBloc>().add(RemoveProduct(product));
              },
              deleteFromCart: (product) {
                context.read<ProductBloc>().add(DeleteProduct(product));
              },
            ),
          ],
        ),
      );
}
