import 'package:flutter/material.dart';
import 'package:mcs/widgets/placeholders/placeholder_item.dart';
import 'package:shimmer/shimmer.dart';

class ProductHolder extends StatelessWidget {
  const ProductHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey[50]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(width: 0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 6 ~/ 2,
          itemBuilder: (context, index) {
            return Column(
              children: [
                PlaceholderItem(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.height * .3,
                ),
                PlaceholderItem(
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.height * .3),
              ],
            );
          },
        ),
      ),
    );
  }
}
