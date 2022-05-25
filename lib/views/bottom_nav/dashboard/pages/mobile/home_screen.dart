library home_screen;

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/navigation/navigationbloc.dart';
import 'package:mcs/blocs/user/userbloc.dart';
import 'package:mcs/resources/repository.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/views/bottom_nav/dashboard/components/search_bar.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';

part '../../components/search_widget.dart';
part '../mobile/components/category_list.dart';
part '../mobile/components/category_card.dart';
part '../mobile/components/best_selling.dart';
part 'components/item_card.dart';
part 'components/product_card.dart';
part 'components/daily_need.dart';
part 'components/veg_card.dart';
part 'components/fresh_veg.dart';
part 'components/dairy_bakery.dart';
part 'components/dairy_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String authToken;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: .5);

  @override
  void initState() {
    super.initState();
    authToken = PreferenceUtils.getString(accessToken);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(context.read<UserRepositoryImpl>()),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: kToolbarHeight * 2,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              bottom: SearchBar(
                onSearch: ((searchText) {}),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: const [
                      CustomAppBar(
                        title: 'Home',
                      ),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const PromotionalBanner(),
                  const CategoryList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best selling",
                          style: kLabelStyleBold.copyWith(fontSize: 14),
                        ),
                        RawChip(
                          onPressed: () {},
                          backgroundColor: primaryLight,
                          visualDensity: VisualDensity.compact,
                          label: Text("View all",
                              style:
                                  kLabelStyle.copyWith(color: secondaryLight)),
                        ),
                      ],
                    ),
                  ),
                  BestSelling(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fresh Vegetables",
                          style: kLabelStyleBold.copyWith(fontSize: 14),
                        ),
                        RawChip(
                          onPressed: () {},
                          backgroundColor: primaryLight,
                          visualDensity: VisualDensity.compact,
                          label: Text("View all",
                              style:
                                  kLabelStyle.copyWith(color: secondaryLight)),
                        ),
                      ],
                    ),
                  ),
                  const FreshVeg(),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Needs",
                          style: kLabelStyleBold.copyWith(fontSize: 14),
                        ),
                        RawChip(
                          onPressed: () {},
                          backgroundColor: primaryLight,
                          visualDensity: VisualDensity.compact,
                          label: Text("View all",
                              style:
                                  kLabelStyle.copyWith(color: secondaryLight)),
                        ),
                      ],
                    ),
                  ),
                  const DailyNeed(
                    height: 225,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dairy & Bakery",
                          style: kLabelStyleBold.copyWith(fontSize: 14),
                        ),
                        RawChip(
                          onPressed: () {},
                          backgroundColor: primaryLight,
                          visualDensity: VisualDensity.compact,
                          label: Text("View all",
                              style:
                                  kLabelStyle.copyWith(color: secondaryLight)),
                        ),
                      ],
                    ),
                  ),
                  const DairyBakery(
                    height: 225,
                  ),
                ],
              ),
            ),
            //grid(),
          ],
        ),
      ),
    );
  }

  Widget grid() => SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('grid item $index'),
            );
          },
          childCount: 10,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 2.0,
        ),
      );

  Widget list() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.all(15),
              child: Container(
                color: Colors.orange[100 * (index % 12 + 1)],
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  "List Item $index",
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            );
          },
          childCount: 10,
        ),
      );
}
