library product_detail;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late ScrollController _controller;
  bool silverCollapsed = false;
  String myTitle = "";

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();

    _controller.addListener(() {
      if (_controller.offset > MediaQuery.of(context).size.height * .25 &&
          !_controller.position.outOfRange) {
        if (!silverCollapsed) {
          // do what ever you want when silver is collapsing !

          myTitle = "Fitness";
          silverCollapsed = true;
          setState(() {});
        }
      }
      if (_controller.offset <= MediaQuery.of(context).size.height * .25 &&
          !_controller.position.outOfRange) {
        if (silverCollapsed) {
          // do what ever you want when silver is expanding !

          myTitle = "";
          silverCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  List<Widget> _buildPageIndicator(int _numPages) {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

/**
 * widget to make indicator icon
 */
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 6.0,
      width: isActive ? 20.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey[700] : Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kDark,
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .40,
              floating: false,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(myTitle, style: kLabelStyle.apply()),
                  background: Stack(
                    children: <Widget>[
                      _buildPageView(context),
                      builIndicator(5),
                    ],
                  )),
            ),
          ];
        },
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) => ItemCard(
                      height: 220,
                      product: ProductModel(),
                      addToCart: (p) {},
                      removeFromCart: (p) {},
                    ),
                    itemCount: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

/**
 * this will render list of courses using bloc builder
 */
  Widget _buildPageView(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .40,
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/1/200/300",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 0)),
                alignment: Alignment.bottomLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 50),
                ),
              ),
            ],
          )
        ],
      ));
    }

    return PageView(
      physics: const ClampingScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      children: list,
    );
  }

/**
 * this will render indicator using blocbuilder course loaded state
 */
  builIndicator(int counter) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: _buildPageIndicator(counter),
              ),
            ],
          )
        ],
      ),
    );
  }
}
