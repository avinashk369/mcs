library product_list;

import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/navigation/navigationbloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/blocs/subcat/subcat_bloc.dart';
import 'package:mcs/blocs/toggle/index_toggled.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/product/components/product_filter.dart';
import 'package:mcs/views/bottom_nav/product/components/product_grid.dart';
import 'package:mcs/views/bottom_nav/product/search/product_search_screen.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../../blocs/category/categorybloc.dart';
import '../../../routes/route_constants.dart';
import '../../../widgets/custom_error_widget.dart';

class ProductList extends StatelessWidget {
  static const String tag = products;
  const ProductList(
      {Key? key,
      required this.category,
      required this.index,
      required this.cityId})
      : super(key: key);
  final CategoryModel category;
  final String cityId;
  final int index;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    bool isCart = false;
    if (state is ProductLoaded) {
      isCart = state.addedProducts!.isNotEmpty;
    }
    return MultiBlocProvider(
      providers: [
        // this is for category toggle
        BlocProvider<ToggleIndexBloc>(
          create: (context) => ToggleIndexBloc(
            Toggled(index: index, isSelected: true),
          ),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: kToolbarHeight * 3,
              automaticallyImplyLeading: true,
              floating: false,
              title: BlocBuilder<SubcatBloc, SubcatState>(
                builder: (context, state) => state.maybeWhen(
                  loaded: (subcats, catName) =>
                      Text(catName ?? category.categoryName!),
                  orElse: () => Text(category.categoryName!),
                ),
              ),
              pinned: true,
              snap: false,
              elevation: 0,
              actions: [
                Builder(builder: (context) {
                  final state = context.watch<ProductBloc>().state;

                  return badge.Badge(
                    position: badge.BadgePosition.topEnd(top: 5, end: 10),
                    // animationDuration:
                    //     const Duration(milliseconds: 300),
                    // animationType: BadgeAnimationType.slide,
                    badgeContent: state.maybeMap(
                      loaded: (res) => Text(
                        res.addedProducts!.length.toString(),
                        style: kLabelStyle.copyWith(color: secondaryLight),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        // change the navigation to the cart page on home screen. index 2 is cart index, it can be changed
                        context.read<NavigationBloc>().changeNavigation(2);
                        // pop the navigation stack to the home screen
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                }),
              ],
              bottom: ProductFilter(
                categoryBloc: context.read<CategoryBloc>(),
                categoryModel: category,
                onTap: (categoryModel, last) {
                  /// swap list items
                  context
                      .read<CategoryBloc>()
                      .add(SwapIndex(current: 0, last: last));
                  context.read<SubcatBloc>().add(SubcatEvent.loadsubcat(
                      catId: categoryModel.id!,
                      cityId: cityId,
                      catName: categoryModel.categoryName));
                },
              ),
            ),

            /// will open after logic is implemented
            state.maybeMap(
              loading: (_) => SliverToBoxAdapter(
                  child: const LoadingUI().verticalPadding(10)),
              loaded: (res) => ProductGrid(products: res.products),
              error: (err) => SliverToBoxAdapter(
                child: CustomErrorWidget(
                  imageUrl: "",
                  message: "Sorry!!! We are not able to find the products",
                  onRetry: () {},
                ),
              ),
              orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
            ),
          ],
        ),
        bottomSheet: isCart
            ? state.maybeMap(
                loaded: (res) => BottomSheetCart(
                    productList: res.addedProducts!,
                    onTap: () {
                      // Navigator.of(context)
                      //     .pushNamed(checkout, arguments: res.addedProducts);
                      // change the navigation to the cart page on home screen. index 2 is cart index, it can be changed
                      context.read<NavigationBloc>().changeNavigation(3);
                      // pop the navigation stack to the home screen
                      Navigator.of(context).pop();
                    }),
                orElse: () => const SizedBox.shrink(),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
