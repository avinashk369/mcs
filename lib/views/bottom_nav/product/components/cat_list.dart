import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/product/components/cat_card.dart';

class CatList extends StatefulWidget implements PreferredSizeWidget {
  const CatList({
    Key? key,
    required this.categories,
    required this.onTap,
    required this.categoryModel,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  final List<CategoryModel> categories;
  final CategoryModel categoryModel;
  final Function(CategoryModel category) onTap;

  @override
  State<CatList> createState() => _CatListState();

  @override
  final Size preferredSize;
}

class _CatListState extends State<CatList> {
  final itemKey = GlobalKey();
  final scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollController.position.ensureVisible(
        itemKey.currentContext!.findRenderObject()!,
        alignment:
            0.5, // How far into view the item should be scrolled (between 0 and 1).
        duration: const Duration(seconds: 1),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          controller: scrollController,
          addAutomaticKeepAlives: true,
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            if (widget.categoryModel == widget.categories[index]) {
              context.read<ToggleIndexBloc>().toggleState(index, false);
            }
            return CatCard(
              key: ValueKey(index),
              categoryModel: widget.categories[index],
              isSeleted: widget.categoryModel == widget.categories[index],
              index: index,
              onTap: (cat) => widget.onTap(cat),
              child: CachedNetworkImage(
                imageUrl: widget.categories[index].categoryImg!,
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: widget.categories.length),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
