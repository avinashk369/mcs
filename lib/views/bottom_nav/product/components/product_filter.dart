import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/blocs/category/category_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/product/components/product_grid.dart';
import 'package:mcs/views/bottom_nav/subcategory/subcat_list.dart';
import 'package:mcs/widgets/loading_ui.dart';
import 'package:mcs/widgets/placeholders/product_holder.dart';

import 'cat_list.dart';

class ProductFilter extends StatelessWidget implements PreferredSizeWidget {
  const ProductFilter({
    Key? key,
    required this.categoryBloc,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  final CategoryBloc categoryBloc;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: kToolbarHeight * 2,
      child: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            bloc: categoryBloc,
            builder: (context, state) {
              return state.maybeMap(
                initial: (_) => const ProductHolder(),
                loaded: (res) => CatList(categories: res.categories),
                error: (err) => Text(err.message),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return state.maybeMap(
                initial: (_) => const ProductHolder(),
                subCatLoaded: (res) => SubCatList(subCategories: res.subcats),
                error: (err) => Text(err.message),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  final Size preferredSize;
}
