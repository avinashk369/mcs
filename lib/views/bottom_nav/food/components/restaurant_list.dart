import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/models/models.dart' show RestaurantModel;
import 'package:mcs/utils/app_constants.dart';
import 'package:mcs/utils/preference_utils.dart';
import 'package:mcs/views/bottom_nav/food/components/restaurant_product_screen.dart';
import 'package:mcs/widgets/dashed_separator.dart';

import 'restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key, required this.restaurants});
  final List<RestaurantModel> restaurants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: restaurants.length,
        separatorBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: DashedSeparator(),
        ),
        itemBuilder: (context, index) => RestaurantCard(
          restaurant: restaurants[index],
          onTap: (restaurant) {
            context.read<ProductBloc>().add(
                  LoadPrdoucts(
                    cityId: PreferenceUtils.getString(currentCityId),
                    categoryId: restaurants[index].id,
                  ),
                );
            Navigator.of(context).pushNamed(RestaurantProductScreen.tag,
                arguments: {"restaurant_model": restaurant});
          },
        ),
      ),
    );
  }
}
