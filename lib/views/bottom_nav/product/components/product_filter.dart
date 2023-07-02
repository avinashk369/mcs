import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/category/category_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/blocs/subcat/subcat_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/subcategory/subcat_list.dart';
import 'package:mcs/widgets/placeholders/product_holder.dart';

import 'cat_list.dart';

class ProductFilter extends StatelessWidget implements PreferredSizeWidget {
  const ProductFilter({
    Key? key,
    required this.categoryBloc,
    required this.onTap,
    required this.categoryModel,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  final CategoryBloc categoryBloc;
  final CategoryModel categoryModel;

  /// to find the selected category
  final Function(CategoryModel categoryModel, int index) onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: kToolbarHeight * 2,
      child: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            bloc: categoryBloc,
            //buildWhen: (previous, current) => (current is CategoryLoaded),
            builder: (context, state) {
              return state.maybeMap(
                initial: (_) => const ProductHolder(),
                swaped: (res) => CatList(
                  categoryModel: categoryModel,
                  categories: res.categories,
                  onTap: (category, index) => onTap(category, index),
                ),
                error: (err) => Text(err.message),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          BlocConsumer<SubcatBloc, SubcatState>(
            listener: (context, state) {
              if (state is SubcatLoaded) {
                context.read<ProductBloc>().add(ProductEvent.loadProduct(
                    cityId: PreferenceUtils.getString(currentCityId),
                    categoryId: state.subcats[0].id));
              }
            },
            builder: (context, state) {
              return state.maybeMap(
                initial: (_) => const ProductHolder(),
                loaded: (res) => SubCatList(subCategories: res.subcats),
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
