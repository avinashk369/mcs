library user_settings;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/views/welcome.dart';

import '../../blocs/navigation/navigationbloc.dart';
import '../order/order_history.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      title: 'Profile',
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    PreferenceUtils.getString(user_name),
                    style: kLabelStyleBold.copyWith(fontSize: 18),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Text(
                    PreferenceUtils.getString(mobile_number),
                    style: kLabelStyleBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                listTileCard(
                  'Orders',
                  onTap: () =>
                      Navigator.of(context).pushNamed(OrderHistory.tag),
                  const Icon(
                    Icons.history,
                    color: redColor,
                  ),
                  context,
                ),
                listTileCard(
                  'Wallet',
                  onTap: () async {},
                  const Icon(
                    Icons.wallet,
                    color: redColor,
                  ),
                  context,
                ),
                listTileCard(
                  'Address book',
                  onTap: () async {},
                  const Icon(
                    Icons.location_city,
                    color: redColor,
                  ),
                  context,
                ),
                listTileCard(
                  'Log out',
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    context.read<NavigationBloc>().changeNavigation(0);

                    await PreferenceUtils.clear();

                    navigator.pushNamedAndRemoveUntil(
                        Welcome.tag, (Route<dynamic> route) => false);
                  },
                  const Icon(
                    Icons.exit_to_app,
                    color: redColor,
                  ),
                  context,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Text(
                    "Online Canteen",
                    style: kLabelStyleBold.copyWith(color: greyColor),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "v1.0.1",
                    style: kLabelStyleBold.copyWith(color: greyColor),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget listTileCard(String title, Widget child, BuildContext context,
          {required Function() onTap}) =>
      InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: greyColor.withOpacity(.03),
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
                    color: greyColor.withOpacity(.08),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: child,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: kLabelStyleBold.copyWith(
                      fontSize: 12, color: Theme.of(context).primaryColor),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: greyColor,
                )
              ],
            ),
          ),
        ),
      );
}
