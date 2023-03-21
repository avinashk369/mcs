library home_screen;

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/blocs/category/category_bloc.dart';
import 'package:mcs/blocs/data/data_bloc.dart';
import 'package:mcs/blocs/navigation/navigationbloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/custom_appbar.dart';
import 'package:mcs/views/bottom_nav/dashboard/components/search_bar.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';
import 'package:mcs/widgets/loading_ui.dart';
import 'package:mcs/widgets/placeholders/product_holder.dart';

import '../../../../../blocs/subcat/subcat_bloc.dart';

part '../../components/search_widget.dart';
part '../mobile/components/category_list.dart';
part '../mobile/components/category_card.dart';
part '../mobile/components/best_selling.dart';
part 'components/item_card.dart';
part '../../../product/components/product_card.dart';
part 'components/daily_need.dart';
part 'components/personal_care_card.dart';
part 'components/personal_care.dart';
part 'components/dairy_bakery.dart';
part 'components/dairy_card.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: kToolbarHeight * 2.3,

            /// change the value to add padding between appbar and searchbar
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0,
            bottom: SearchBar(
              onSearch: ((searchText) {}),
              onTouched: () => Navigator.of(context).pushNamed(productSearch),
              readOnly: true,
            ),
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  children: const [
                    CustomAppBar(
                      title: 'Village doohri',
                      isSubtitle: true,
                      subtitle: 'Village doohri, Pilkuhwa UP',
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<DataBloc, DataState>(builder: (context, state) {
                  return state.maybeMap(
                    loading: (value) => LoadingUI(),
                    bannersLoaded: (value) =>
                        PromotionalBanner(banners: value.banners),
                    orElse: () => const SizedBox.shrink(),
                  );
                }),
                BlocBuilder<CategoryBloc, CategoryState>(
                  buildWhen: (previous, current) =>
                      (current != previous && current is CategoryLoaded),
                  builder: (context, state) {
                    return state.maybeMap(
                      loading: (_) => const ProductHolder(),
                      loaded: (res) => CategoryList(categories: res.categories),
                      error: (err) => Text(err.message),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                const SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Best selling",
                //         style: kLabelStyleBold.copyWith(fontSize: 18),
                //       ),
                //       RawChip(
                //         onPressed: () {},
                //         backgroundColor: primaryLight,
                //         visualDensity: VisualDensity.compact,
                //         label: Text("View all",
                //             style: kLabelStyle.copyWith(color: secondaryLight)),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 8),
                // BlocBuilder<ProductBloc, ProductState>(
                //   builder: (context, state) {
                //     return state.maybeMap(
                //       initial: (_) => const ProductHolder(),
                //       loaded: (res) => BestSelling(
                //         products: res.products,
                //       ),
                //       error: (err) => Text(err.message),
                //       orElse: () => const SizedBox.shrink(),
                //     );
                //   },
                // ),
                // const SizedBox(height: 8),
                // Container(
                //     margin: const EdgeInsets.symmetric(horizontal: 8),
                //     height: size.height * 0.15,
                //     decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 192, 242, 194),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8),
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("Suggest new items",
                //                   style: kLabelStyleBold.copyWith(
                //                       fontSize: 18,
                //                       fontFamily:
                //                           GoogleFonts.nunitoSans().fontFamily)),
                //               // Pulse(
                //               //   infinite: true,
                //               //   delay: const Duration(milliseconds: 800),
                //               //   child: CircleAvatar(
                //               //     backgroundColor: Colors.amber[400],
                //               //     child: const Icon(
                //               //       Icons.keyboard_arrow_right,
                //               //       color: darkColor,
                //               //     ),
                //               //   ),
                //               // ),
                //               IconButton(
                //                 onPressed: () {},
                //                 icon: CircleAvatar(
                //                   backgroundColor: Colors.amber[400],
                //                   child: const Icon(
                //                     Icons.keyboard_arrow_right,
                //                     color: darkColor,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Text(
                //               "Let us know your favourite products that you currently don't see in th app. We will do out best to bring them to you.",
                //               style: kLabelStyleBold.copyWith(
                //                 fontSize: 10,
                //                 color: Colors.grey,
                //               )),
                //         ],
                //       ),
                //     )),
                // const SizedBox(height: 8),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Personal care",
                //         style: kLabelStyleBold.copyWith(fontSize: 18),
                //       ),
                //       RawChip(
                //         onPressed: () {},
                //         backgroundColor: primaryLight,
                //         visualDensity: VisualDensity.compact,
                //         label: Text("View all",
                //             style: kLabelStyle.copyWith(color: secondaryLight)),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 8),
                // BlocBuilder<ProductBloc, ProductState>(
                //   builder: (context, state) {
                //     return state.maybeMap(
                //       initial: (_) => LoadingUI(),
                //       loaded: (res) => PersonalCare(
                //         products: res.personalCare!,
                //       ),
                //       error: (err) => Text(err.message),
                //       orElse: () => const SizedBox.shrink(),
                //     );
                //   },
                // ),
                // const SizedBox(
                //   height: 12,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Daily Needs",
                //         style: kLabelStyleBold.copyWith(fontSize: 18),
                //       ),
                //       RawChip(
                //         onPressed: () {},
                //         backgroundColor: primaryLight,
                //         visualDensity: VisualDensity.compact,
                //         label: Text("View all",
                //             style: kLabelStyle.copyWith(color: secondaryLight)),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 8),
                // BlocBuilder<ProductBloc, ProductState>(
                //   builder: (context, state) {
                //     return state.map(
                //       initial: (_) => LoadingUI(),
                //       loading: (_) => LoadingUI(),
                //       loaded: (res) => DailyNeed(
                //         products: res.dailyNeeds!,
                //         height: 280,
                //       ),
                //       error: (err) => Text(err.message),
                //     );
                //   },
                // ),
                // const SizedBox(
                //   height: 12,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Dairy & Bakery",
                //         style: kLabelStyleBold.copyWith(fontSize: 18),
                //       ),
                //       RawChip(
                //         onPressed: () {},
                //         backgroundColor: primaryLight,
                //         visualDensity: VisualDensity.compact,
                //         label: Text("View all",
                //             style: kLabelStyle.copyWith(color: secondaryLight)),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 8),
                // BlocBuilder<ProductBloc, ProductState>(
                //   builder: (context, state) {
                //     return state.map(
                //       initial: (_) => const ProductHolder(),
                //       loading: (_) => LoadingUI(),
                //       loaded: (res) => DairyBakery(
                //         products: res.dairyProducts!,
                //         height: 280,
                //       ),
                //       error: (err) => Text(err.message),
                //     );
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Simple".toUpperCase(),
                        style: kLabelStyleBold.copyWith(
                          fontSize: 35,
                          color: Colors.blueGrey[100],
                          letterSpacing: 2,
                          height: 1.5,
                          fontFamily: GoogleFonts.archivoBlack().fontFamily,
                        ),
                      ),
                      Text(
                        "Better".toUpperCase(),
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.blueGrey[100],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          fontFamily: GoogleFonts.archivoBlack().fontFamily,
                        ),
                      ),
                      Text(
                        "Shopping".toUpperCase(),
                        style: kLabelStyleBold.copyWith(
                          fontSize: 35,
                          color: Colors.blueGrey[100],
                          letterSpacing: 2,
                          fontFamily: GoogleFonts.archivoBlack().fontFamily,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Text(
                          "We make refined product selection based on quality and we assure it..."
                              .toUpperCase(),
                          style: kLabelStyle.copyWith(color: Colors.grey[400]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //grid(),
        ],
      ),
    );
  }
}
