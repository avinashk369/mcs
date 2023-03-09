import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  final Function(CategoryModel category, int index) onTap;

  @override
  final Size preferredSize;

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  final scrollController = ScrollController();

  void scrollToMaxExtent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
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
            return CatCard(
              categoryModel: widget.categories[index],
              index: index,
              onTap: (cat, index) {
                widget.onTap(cat, index);
                scrollToMaxExtent();
              },
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
