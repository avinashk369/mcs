library product_search_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/product_utility.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';

import '../../../../utils/styles.dart';
import '../../../../utils/theme_constants.dart';
import '../../../../widgets/loading_ui.dart';
import '../../dashboard/components/search_bar.dart';
import '../components/product_grid.dart';
part './components/bottom_sheet_cart.dart';

class ProductSearchScreen extends StatelessWidget {
  const ProductSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    bool isCart = false;
    if (state is ProductLoaded) {
      isCart = state.addedProducts!.isNotEmpty;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Product'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                SearchBar(
                  autoFocus: true,
                  onSearch: (searchText) {
                    /// need to call bloc event to search product
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    context
                        .read<ProductBloc>()
                        .add(SearchProduct(keyword: searchText, cityId: "4"));
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          state.maybeMap(
            loading: (_) =>
                SliverToBoxAdapter(child: LoadingUI().verticalPadding(10)),
            loaded: (res) => ProductGrid(products: res.products),
            error: (err) => SliverToBoxAdapter(
              child: Center(
                  child: Text(
                err.message,
                style: kLabelStyleBold.copyWith(color: redColor),
              )),
            ),
            orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          )
        ],
      ),
      bottomSheet: isCart
          ? state.maybeMap(
              loaded: (res) => BottomSheetCart(
                products: res.addedProducts!,
                onTap: () => Navigator.of(context)
                    .pushNamed(checkout, arguments: res.addedProducts),
              ),
              orElse: () => const SizedBox.shrink(),
            )
          : const SizedBox.shrink(),
    );
  }
}
