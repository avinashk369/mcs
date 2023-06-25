import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/restaurant/restaurant_bloc.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/resources/restaurant/restaurant_repositoryImpl.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/food/food_screen.dart';
import 'package:mcs/views/factories/prodcut/product_list_interface.dart';
import 'package:mcs/views/factories/prodcut/product_type_enums.dart';
import 'package:mcs/widgets/loading_ui.dart';

class RestaurantProductScreen extends StatelessWidget {
  static const String tag = restaurantProduct;
  const RestaurantProductScreen({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantBloc(context.read<RestaurantRepositoryImpl>())
            ..add(
              LoadRestaurantProducts(
                request: {
                  "city_id": PreferenceUtils.getString(currentCityId),
                  "category_id": restaurantModel.id
                },
              ),
            ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .25,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              bottom: const FoodFilter(),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      AppBar(),
                      Text(
                        restaurantModel.categoryName!,
                        style: kLabelStyleBold.copyWith(fontSize: 20),
                      ),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 20),
                  BlocBuilder<RestaurantBloc, RestaurantState>(
                    builder: (context, state) => state.maybeMap(
                      orElse: () => const SizedBox.shrink(),
                      loading: (value) => const LoadingUI(),
                      productLoaded: (value) => ProductFactory.buildList(
                          productType: ProductType.food,
                          addToCart: (product) => {print(product.name)},
                          removeFromCart: (product) => {},
                          products: value.products),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
