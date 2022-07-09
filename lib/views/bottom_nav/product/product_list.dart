library product_list;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/blocs/toggle/index_toggled.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/resources/category/category_repositoryImpl.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
import 'package:mcs/views/bottom_nav/food/food_screen.dart';
import 'package:mcs/views/bottom_nav/product/components/cat_list.dart';
import 'package:mcs/views/bottom_nav/product/components/product_filter.dart';
import 'package:mcs/views/bottom_nav/product/components/product_grid.dart';
import 'package:mcs/views/bottom_nav/subcategory/subcat_list.dart';
import 'package:mcs/widgets/loading_ui.dart';
import 'package:mcs/widgets/placeholders/product_holder.dart';

import '../../../blocs/category/categorybloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.category, required this.index})
      : super(key: key);
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(
            context.read<CategoryRepositoryImpl>(),
          )..add(const CategoryEvent.loadSubcategory(catId: "1")),
        ),

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
              title: const Text("Products"),
              pinned: true,
              snap: false,
              elevation: 0,
              bottom: ProductFilter(
                categoryBloc: context.read<CategoryBloc>(),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return state.maybeMap(
                  initial: (_) => LoadingUI(),
                  loaded: (res) => ProductGrid(products: res.products),
                  error: (err) => Text(err.message),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
