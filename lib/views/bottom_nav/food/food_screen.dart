library food_screen;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/_sliver_appbar_delegate.dart';
import 'package:mcs/widgets/custom_appbar.dart';
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
    _tabController.dispose();
    scrollController.dispose();
  }

  final breakfastKey = GlobalKey();
  final lunchKey = GlobalKey();
  final snacksKey = GlobalKey();
  final dinnerKey = GlobalKey();
  final sliverListtKey = GlobalKey();

  late ScrollController scrollController;

  late TabController _tabController;
  double? breakfastHeight;
  double? lunchHeight;
  double? snacksHeight;
  double? dinnerHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();

    _tabController = TabController(length: 4, vsync: this);
    addScrollControllerListener();
  }

  void addScrollControllerListener() {
    scrollController.addListener(() {
      if (breakfastKey.currentContext != null) {
        breakfastHeight = breakfastKey.currentContext!.size!.height;
      }
      if (lunchKey.currentContext != null) {
        lunchHeight = lunchKey.currentContext!.size!.height;
      }
      if (snacksKey.currentContext != null) {
        snacksHeight = snacksKey.currentContext!.size!.height;
      }
      if (dinnerKey.currentContext != null) {
        dinnerHeight = dinnerKey.currentContext!.size!.height;
      }
      if (scrollController.offset > breakfastHeight! + 200 &&
          scrollController.offset < lunchHeight! + breakfastHeight! + 200) {
      } else {}
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (scrollController.offset > 0 &&
            scrollController.offset < breakfastHeight! + 200) {
          _tabController.animateTo(0);
        } else if (scrollController.offset > breakfastHeight! + 200 &&
            scrollController.offset < lunchHeight! + breakfastHeight! + 200) {
          _tabController.animateTo(1);
        } else if (scrollController.offset >
                lunchHeight! + breakfastHeight! + 200 &&
            scrollController.offset <
                lunchHeight! + breakfastHeight! + snacksHeight! + 200) {
          _tabController.animateTo(2);
        } else if (scrollController.offset >
                lunchHeight! + breakfastHeight! + snacksHeight! + 200 &&
            scrollController.offset <=
                lunchHeight! +
                    breakfastHeight! +
                    snacksHeight! +
                    dinnerHeight! +
                    200) {
          _tabController.animateTo(3);
        } else {}
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (scrollController.offset < breakfastHeight!) {
          _tabController.animateTo(0);
        } else if (scrollController.offset > breakfastHeight! &&
            scrollController.offset < lunchHeight! + breakfastHeight!) {
          _tabController.animateTo(1);
        } else if (scrollController.offset > lunchHeight! + breakfastHeight! &&
            scrollController.offset <
                lunchHeight! + breakfastHeight! + snacksHeight!) {
          _tabController.animateTo(2);
        } else if (scrollController.offset >
                lunchHeight! + breakfastHeight! + snacksHeight! &&
            scrollController.offset <
                lunchHeight! +
                    breakfastHeight! +
                    snacksHeight! +
                    dinnerHeight!) {
          _tabController.animateTo(3);
        } else {}
      }
    });
  }

  void tabBarOnTap(val) {
    switch (val) {
      case 0:
        {
          if (breakfastKey.currentContext == null) {
            scrollController.position
                .ensureVisible(
              snacksKey.currentContext!.findRenderObject()!,
              alignment:
                  0.0, // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 200),
            )
                .then((value) {
              scrollController.position
                  .ensureVisible(
                snacksKey.currentContext!.findRenderObject()!,
                alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  lunchKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    breakfastKey.currentContext!.findRenderObject()!,
                    alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            });
          } else {
            scrollController.position.ensureVisible(
              breakfastKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
      case 1:
        {
          if (lunchKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                breakfastKey.currentContext!.findRenderObject()!,
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  breakfastKey.currentContext!.findRenderObject()!,
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    lunchKey.currentContext!.findRenderObject()!,
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            } else {
              scrollController.position
                  .ensureVisible(
                snacksKey.currentContext!.findRenderObject()!,
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  snacksKey.currentContext!.findRenderObject()!,
                  alignment: 0.0,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    lunchKey.currentContext!.findRenderObject()!,
                    alignment: 0.5,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position.ensureVisible(
                      lunchKey.currentContext!.findRenderObject()!,
                      alignment: 0.0,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    );
                  });
                });
              });
            }
          } else {
            scrollController.position.ensureVisible(
              lunchKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 400),
            );
          }
        }
        break;
      case 2:
        {
          if (snacksKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                breakfastKey.currentContext!.findRenderObject()!,
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  breakfastKey.currentContext!.findRenderObject()!,
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    lunchKey.currentContext!.findRenderObject()!,
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position
                        .ensureVisible(
                      lunchKey.currentContext!.findRenderObject()!,
                      alignment: 0.5,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController.position.ensureVisible(
                        snacksKey.currentContext!.findRenderObject()!,
                        alignment: 0,
                        // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      );
                    });
                  });
                });
              });
            } else if (_tabController.previousIndex == 1) {
              scrollController.position
                  .ensureVisible(
                lunchKey.currentContext!.findRenderObject()!,
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position.ensureVisible(
                  snacksKey.currentContext!.findRenderObject()!,
                  alignment: 0,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                );
              });
            }
          } else {
            scrollController.position.ensureVisible(
              snacksKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 600),
            );
          }
        }
        break;
      case 3:
        {
          if (dinnerKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                breakfastKey.currentContext!.findRenderObject()!,
                alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  breakfastKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.5, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    lunchKey.currentContext!.findRenderObject()!,
                    alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position
                        .ensureVisible(
                      lunchKey.currentContext!.findRenderObject()!,
                      alignment:
                          0.5, // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController.position
                          .ensureVisible(
                        snacksKey.currentContext!.findRenderObject()!,
                        alignment:
                            0.0, // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      )
                          .then((value) {
                        scrollController.position
                            .ensureVisible(
                          snacksKey.currentContext!.findRenderObject()!,
                          alignment:
                              0.5, // How far into view the item should be scrolled (between 0 and 1).
                          duration: const Duration(milliseconds: 200),
                        )
                            .then((value) {
                          scrollController.position.ensureVisible(
                            dinnerKey.currentContext!.findRenderObject()!,
                            alignment:
                                0.0, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(milliseconds: 200),
                          );
                        });
                      });
                    });
                  });
                });
              });
            } else {
              scrollController.position
                  .ensureVisible(
                lunchKey.currentContext!.findRenderObject()!,
                alignment:
                    1.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  snacksKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    dinnerKey.currentContext!.findRenderObject()!,
                    alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            }
          } else {
            scrollController.position.ensureVisible(
              dinnerKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
    }
  }

  SliverPersistentHeader makeTabBarHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        TabBar(
          onTap: (value) => tabBarOnTap(value),
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          labelStyle: kLabelStyleBold,
          unselectedLabelStyle: kLabelStyleBold,
          indicatorPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.redAccent),
          tabs: [
            Tab(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Breakfast",
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Lunch",
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Snacks",
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Dinner",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            bottom: const FoodFilter(),
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  children: [
                    CustomAppBar(
                      notificationLCick: () {},
                      title: 'Kurup',
                      subtitle: 'Maxfit Score: 90',
                      uImage:
                          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202111/dulquer-salmaan-kurup_1200x768.jpeg?jbqqPVeT_Ywt_NYhCQ_Zq0KY1Tl8rUqP&size=1200:675',
                      imageClick: () {},
                    ),
                    const FoodBanner(),
                  ],
                )),
          ),
          makeTabBarHeader(),
          SliverList(
            key: sliverListtKey,
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    BreakfastList(
                      key: breakfastKey,
                      title: "Breakfast",
                      imgUrl:
                          "https://image.freepik.com/free-photo/breakfast-valentine-s-day-fried-eggs-bread-shape-heart-fresh-vegetables_114579-85492.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: size.height * .25,
                      width: size.width,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.freepik.com/free-photo/delicious-breakfast-meal-composition_23-2148878834.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BreakfastList(
                      key: lunchKey,
                      title: "Lunch",
                      imgUrl:
                          "https://img.freepik.com/free-photo/tortilla-wrap-with-falafel-fresh-salad-vegan-tacos-vegetarian-healthy-food_2829-6193.jpg?size=338&ext=jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: size.height * .25,
                      width: size.width,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.freepik.com/free-photo/traditional-uzbek-oriental-cuisine-uzbek-family-table-from-different-dishes-new-year-holiday_127425-162.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BreakfastList(
                      key: snacksKey,
                      title: "Snacks",
                      imgUrl:
                          "https://image.freepik.com/free-vector/hand-drawn-fast-food-illustration_23-2149013387.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: size.height * .25,
                      width: size.width,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.freepik.com/free-photo/portuguese-baked-eggplants-with-mushrooms_127425-137.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BreakfastList(
                      key: dinnerKey,
                      title: "Dinner",
                      imgUrl:
                          "https://img.freepik.com/free-vector/kitchen-top-view-illustration_1284-10106.jpg?size=338&ext=jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: size.height * .25,
                      width: size.width,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.freepik.com/free-vector/blackboard-background-with-burger_23-2148907814.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
