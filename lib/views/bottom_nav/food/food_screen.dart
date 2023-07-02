library food_screen;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/blocs/restaurant/restaurant_bloc.dart';
import 'package:mcs/blocs/toggle/index_toggled.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/resources/restaurant/restaurant_repositoryImpl.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/common_appbar.dart';
import 'package:mcs/views/bottom_nav/food/components/restaurant_list.dart';
import 'package:mcs/views/bottom_nav/product/components/variant_card.dart';
import 'package:mcs/views/bottom_nav/product/search/product_search_screen.dart';
import 'package:mcs/views/bottom_nav/searchbar_placeholder.dart';
import 'package:mcs/widgets/custom_error_widget.dart';
import 'package:mcs/widgets/loading_ui.dart';
part 'components/food_banner.dart';
part 'components/lunch_list.dart';
part 'components/food_card.dart';
part 'components/dinner_list.dart';
part 'components/snacks_list.dart';
part 'components/breakfast_list.dart';
part 'components/orders.dart';
part 'components/food_filter.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  final breakfastKey = GlobalKey();
  final lunchKey = GlobalKey();
  final snacksKey = GlobalKey();
  final dinnerKey = GlobalKey();
  final sliverListtKey = GlobalKey();

  late ScrollController scrollController;

  double? breakfastHeight;
  double? lunchHeight;
  double? snacksHeight;
  double? dinnerHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantBloc(context.read<RestaurantRepositoryImpl>())
            ..add(
              LoadRestaurant(
                request: {
                  "city_id": PreferenceUtils.getString(currentCityId),
                  "category_id": "9"
                },
              ),
            ),
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .45,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              bottom: SearchbarPlaceholder(
                hintList: searchHintFood,
                onTap: () {
                  context.read<ProductBloc>().add(const StartSearch());
                  Navigator.of(context).pushNamed(ProductSearchScreen.tag);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      CommonAppbar(
                          onLocationLoaded: (value) => null,
                          onPermissionDenied: (permissionDenied) => null,
                          onServiceDisabled: (serviceDisabled) => null),
                      const FoodBanner(),
                    ],
                  )),
            ),
            SliverList(
              key: sliverListtKey,
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<RestaurantBloc, RestaurantState>(
                        builder: (context, state) => state.maybeMap(
                          orElse: () => const SizedBox.shrink(),
                          error: (value) => const CustomErrorWidget(
                            message:
                                "Sorry!!! We are not able to find the products",
                          ),
                          loaded: (value) =>
                              RestaurantList(restaurants: value.restaurants),
                          loading: (value) => const LoadingUI(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
