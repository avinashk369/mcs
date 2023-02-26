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
import 'package:mcs/resources/category/category_repositoryImpl.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/product/components/product_filter.dart';
import 'package:mcs/views/bottom_nav/product/components/product_grid.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../../blocs/category/categorybloc.dart';

class ProductList extends StatelessWidget {
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
    return MultiBlocProvider(
      providers: [
        // this is for category toggle
        BlocProvider<ToggleIndexBloc>(
          create: (context) => ToggleIndexBloc(
            IndexToggled(index: index, isSelected: true),
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
                onTap: (categoryModel) {
                  context.read<SubcatBloc>().add(SubcatEvent.loadsubcat(
                      catId: categoryModel.id!,
                      cityId: cityId,
                      catName: categoryModel.categoryName));
                },
              ),
            ),

            /// will open after logic is implemented
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return state.maybeMap(
                  initial: (_) => SliverToBoxAdapter(child: LoadingUI()),
                  loaded: (res) => ProductGrid(products: res.products),
                  error: (err) => SliverToBoxAdapter(child: Text(err.message)),
                  orElse: () =>
                      const SliverToBoxAdapter(child: SizedBox.shrink()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
