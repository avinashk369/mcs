library dashboard;

import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/login/login_bloc.dart';
import 'package:mcs/blocs/navigation/navigation_bloc.dart';
import 'package:mcs/blocs/user/userbloc.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/utils/utils.dart';
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

//On Home Page, for food icon pressed
  Future<void> checkCredsAndNavigate(int index, BuildContext context) async {
    context.read<NavigationBloc>().changeNavigation(index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(context.read<UserRepositoryImpl>())
            ..add(LoadUserVehicles(token: token, userId: userId)),
        ),
      ],
      child: Scaffold(
        extendBody: true,
        body: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            print("current index $state");
            return IndexedStack(
              index: state, //controller.currentIndex.value,
              children: [
                TabNavigationItem.items[0].page,
                TabNavigationItem.items[1].page,
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: NavigationBarTheme(
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
                  destinations: [
                    for (final tabItem in TabNavigationItem.items)
                      NavigationDestination(
                        icon: tabItem.icon,
                        label: tabItem.title,
                        selectedIcon: tabItem.selectedIcon,
                      ),
                  ],
                ),
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
