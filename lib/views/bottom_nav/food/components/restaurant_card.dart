import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/models/models.dart' show RestaurantModel;
import 'package:mcs/utils/styles.dart';
import 'package:mcs/utils/theme_constants.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {super.key, required this.restaurant, required this.onTap});
  final RestaurantModel restaurant;
  final Function(RestaurantModel restaurantModel) onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => onTap(restaurant),
      child: SizedBox(
        height: size.height * .25,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .2,
              width: size.width,
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                semanticContainer: true,
                color: secondaryLight,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: CachedNetworkImage(
                  imageUrl: restaurant.categoryImg ?? '',
                  errorWidget: (_, __, ___) =>
                      Image.asset('assets/images/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              restaurant.categoryName!,
              style: kLabelStyleBold.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
