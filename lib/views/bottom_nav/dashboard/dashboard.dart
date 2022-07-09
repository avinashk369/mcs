library dashboard;

import 'dart:async';
import 'dart:math';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/login/login_bloc.dart';
import 'package:mcs/blocs/navigation/navigation_bloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/blocs/user/userbloc.dart';
import 'package:mcs/resources/product/product_repositoryImpl.dart';
import 'package:mcs/resources/user/user_repository.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/loading_ui.dart';
import 'package:share/share.dart';

import '../TabNavigationItem.dart';
part 'components/promotional_banner.dart';
part 'components/subjects_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

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
  Future<void> checkCredsAndNavigate(int index, BuildContext context) async {
    context.read<NavigationBloc>().changeNavigation(index);
  }

  @override
  Widget build(BuildContext context) {
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
        //extendBody: true,
        body: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            return IndexedStack(
              index: state, //controller.currentIndex.value,
              // children: [
              //   TabNavigationItem.items[0].page,
              //   TabNavigationItem.items[1].page,
              // ],
              children:
                  TabNavigationItem.items.map((item) => item.page).toList(),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
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
                  checkCredsAndNavigate(index, context);
                },

                destinations: TabNavigationItem.items
                    .map(
                      (item) => NavigationDestination(
                        icon: item.title == cart
                            ? Builder(builder: (context) {
                                final state =
                                    context.watch<ProductBloc>().state;

                                return Badge(
                                  position:
                                      BadgePosition.topEnd(end: -5, top: -5),
                                  // animationDuration:
                                  //     const Duration(milliseconds: 300),
                                  // animationType: BadgeAnimationType.slide,
                                  badgeContent: state.maybeMap(
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
                                final state =
                                    context.watch<ProductBloc>().state;
                                return Badge(
                                  position:
                                      BadgePosition.topEnd(end: -5, top: -5),
                                  badgeContent: state.maybeMap(
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
      ),
    );
  }

  _onShareWithEmptyOrigin(BuildContext context, String url) async {
    await Share.share(url);
  }
}
