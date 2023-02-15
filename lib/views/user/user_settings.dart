library user_settings;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/appbar/cusotm_appbar.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';

import '../../blocs/user/userbloc.dart';
import '../../widgets/themes/config.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(context.read<UserRepositoryImpl>()),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: kToolbarHeight,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: const [
                      CustomAppBar(
                        title: 'Settings',
                      ),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  listTileCard(
                    'My Vehicles',
                    () {
                      currentTheme.toggleTheme();
                      print("On tapped");
                    },
                    CachedNetworkImage(imageUrl: carImage),
                  ),
                  listTileCard(
                    'My Wallet',
                    () async {},
                    const Icon(
                      Icons.wallet_membership,
                    ),
                  ),
                  listTileCard(
                    'Help',
                    () async {},
                    const Icon(
                      Icons.help,
                    ),
                  ),
                  listTileCard(
                    'Log out',
                    () async {
                      final navigator = Navigator.of(context);
                      await PreferenceUtils.clear();

                      navigator.pushNamedAndRemoveUntil(
                          homeRoute, (Route<dynamic> route) => false);
                    },
                    const Icon(
                      Icons.exit_to_app,
                      color: redColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listTileCard(String title, Function() onTap, Widget child) => InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: Colors.grey[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: child,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: kLabelStyleBold.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      );
}
