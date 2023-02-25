library subcat_list;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/toggle/index_toggled.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/utils/utils.dart';

import '../../../models/category/subcat_model.dart';
part 'subcat_card.dart';

class SubCatList extends StatelessWidget {
  const SubCatList({Key? key, required this.subCategories}) : super(key: key);
  final List<SubCateModel> subCategories;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleIndexBloc(
        const IndexToggled(index: 0, isSelected: true),
      ),
      child: Builder(builder: (context) {
        return SizedBox(
          height: 40,
          child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(width: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) => SubCatCard(
                    subcatModel: index == 0
                        ? const SubCateModel(categoryName: "All", id: "0")
                        : subCategories[index - 1],
                    onTap: (subcat) => context
                        .read<ToggleIndexBloc>()
                        .toggleState(index, false),
                    index: index,
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/1/200/200",
                      fit: BoxFit.cover,
                    ),
                  ),
              itemCount: subCategories.length + 1),
        );
      }),
    );
  }
}
