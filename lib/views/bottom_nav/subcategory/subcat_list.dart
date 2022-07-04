library subcat_list;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/utils/styles.dart';
part 'subcat_card.dart';

class SubCatList extends StatelessWidget {
  const SubCatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
                width: 5,
              ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => SubCatCard(
                title: 'Sub Cat $index',
                onTap: () => null,
                child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/id/1/200/200",
                  fit: BoxFit.cover,
                ),
              ),
          itemCount: 5),
    );
  }
}
