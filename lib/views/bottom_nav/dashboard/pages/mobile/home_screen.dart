library home_screen;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/user/userbloc.dart';
import 'package:mcs/resources/repository.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/views/bottom_nav/dashboard/components/search_bar.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';

part '../../components/search_widget.dart';
part '../mobile/components/category_list.dart';
part '../mobile/components/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String authToken;
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
                  const CategoryList(),
                  const PromotionalBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
