library dashboard;

import 'dart:async';
import 'dart:math';

import 'package:badges/badges.dart' as badge;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcs/blocs/navigation/navigation_bloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../../models/banner/banner_model.dart';
import '../../../routes/route_constants.dart';
import '../TabNavigationItem.dart';
part 'components/promotional_banner.dart';
part 'components/subjects_list.dart';

class Dashboard extends StatefulWidget {
  static const String tag = dashboardRoute;
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool hasSeen = false;
  late String userId;
  late String token;
  @override
  void initState() {
    userId = PreferenceUtils.getString(user_id);
    token = PreferenceUtils.getString(accessToken);
    super.initState();
  }

// navigate to login screen if user taps on index where authentication is required
  Future<void> checkCredsAndNavigate(int index, BuildContext context,
      {bool isCart = false}) async {
    isCart
        ? context.read<NavigationBloc>().changeNavigation(index)
        : Fluttertoast.showToast(msg: 'Your cart is empty');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      body: BlocBuilder<NavigationBloc, int>(
        builder: (context, state) => IndexedStack(
          index: state,
          children: TabNavigationItem.items.map((item) => item.page).toList(),
        ),
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, int>(
        builder: (context, state) {
          final prodState = context.watch<ProductBloc>().state;
          bool isCart = false;
          if (prodState is ProductLoaded) {
            isCart = prodState.addedProducts!.isNotEmpty;
          }
          return NavigationBarTheme(
            data: const NavigationBarThemeData(
              indicatorColor: primaryLight,
            ),
            child: NavigationBar(
              backgroundColor: Colors.grey[100],
              height: 60,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              selectedIndex: state, //controller.currentIndex.value,
              animationDuration: const Duration(seconds: 1),
              onDestinationSelected: (int index) {
                checkCredsAndNavigate(index, context, isCart: isCart);
              },

              destinations: TabNavigationItem.items
                  .map(
                    (item) => NavigationDestination(
                      icon: item.title == cart
                          ? Builder(builder: (context) {
                              return badge.Badge(
                                position: badge.BadgePosition.topEnd(
                                    end: -5, top: -5),
                                // animationDuration:
                                //     const Duration(milliseconds: 300),
                                // animationType: BadgeAnimationType.slide,
                                badgeContent: prodState.maybeMap(
                                  loaded: (res) => Text(
                                    res.addedProducts!.length.toString(),
                                    style: kLabelStyle.copyWith(
                                        color: secondaryLight),
                                  ),
                                  orElse: () => const SizedBox.shrink(),
                                ),
                                child: item.icon,
                              );
                            })
                          : item.icon,
                      label: item.title,
                      selectedIcon: item.title == cart
                          ? Builder(builder: (context) {
                              return badge.Badge(
                                position: badge.BadgePosition.topEnd(
                                    end: -5, top: -5),
                                badgeContent: prodState.maybeMap(
                                  loaded: (res) => Text(
                                    res.addedProducts!.length.toString(),
                                    style: kLabelStyle.copyWith(
                                        color: secondaryLight),
                                  ),
                                  orElse: () => const SizedBox.shrink(),
                                ),
                                child: item.selectedIcon,
                              );
                            })
                          : item.selectedIcon,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
