import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/product/components/cat_card.dart';

class CatList extends StatelessWidget implements PreferredSizeWidget {
  const CatList({
    Key? key,
    required this.categories,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          addAutomaticKeepAlives: true,
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => CatCard(
                categoryModel: categories[index],
                index: index,
                onTap: (cat) {
                  context.read<ToggleIndexBloc>().toggleState(index, false);

                  // load products based on cat id
                },
                child: CachedNetworkImage(
                  imageUrl: categories[index].thumb!,
                  fit: BoxFit.fill,
                ),
              ),
          itemCount: categories.length),
    );
  }

  @override
  final Size preferredSize;
}
