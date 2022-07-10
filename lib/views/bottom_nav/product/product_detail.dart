library product_detail;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/navigation/navigationbloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
import 'package:mcs/widgets/loading_ui.dart';

import '../../../blocs/product/productbloc.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

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

          myTitle = "Product Detail";
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
      bottomNavigationBar: SizedBox(
        height: 45,
        child: BottomAppBar(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                final state = context.watch<ProductBloc>().state;

                return Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.shopping_cart),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      fixedSize: const Size.fromHeight(45),
                      primary: secondaryLight,
                      onPrimary: darkColor,
                    ),
                    onPressed: (state is ProductLoaded) &&
                            state.addedProducts!.contains(
                                widget.productModel.copyWith(count: 1))
                        ? null
                        : () => context.read<ProductBloc>().add(AddProduct(
                            productModel:
                                widget.productModel.copyWith(count: 1),
                            isCart: false)),
                    label: Text(
                      "Add to cart".toUpperCase(),
                      style: kLabelStyleBold.copyWith(fontSize: 14),
                    ),
                  ),
                );
              }),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    fixedSize: const Size.fromHeight(45),
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    // make sure the product has been added to the cart
                    context.read<ProductBloc>().add(AddProduct(
                        productModel: widget.productModel.copyWith(count: 1),
                        isCart: false));
                    // change the navigation to the cart page on home screen. index 2 is cart index, it can be changed
                    context.read<NavigationBloc>().changeNavigation(2);
                    // pop all the navigation stack to the home screen
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text(
                    "Buy now".toUpperCase(),
                    style: kLabelStyleBold.copyWith(
                        fontSize: 14, color: secondaryLight),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * .40,
            floating: false,
            title: Text(myTitle),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  _buildPageView(context),
                  builIndicator(5),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(widget.productModel.brand!,
                            style: kLabelStyle.copyWith(
                                fontSize: 11, color: Colors.grey[400])),
                        Text(widget.productModel.name!),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(widget.productModel.desc!),
                        const SizedBox(height: 8),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "₹${widget.productModel.offerPrice.toString()}",
                              style: kLabelStyleBold.copyWith(
                                fontSize: 14,
                              )),
                          TextSpan(
                              text: " ",
                              style: kLabelStyleBold.copyWith(
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: "₹${widget.productModel.price.toString()}",
                              style: kLabelStyleBold.copyWith(
                                  fontSize: 10,
                                  color: greyColor,
                                  decoration: TextDecoration.lineThrough)),
                        ])),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: primaryLight,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Note: ",
                                  style: kLabelStyleBold.copyWith(
                                    fontSize: 12,
                                    color: secondaryLight,
                                  )),
                              TextSpan(
                                  text:
                                      "We endeavour to deliver the best quality products at the best prices. However, we cannot guarantee that all products are available in all areas.",
                                  style: kLabelStyle.copyWith(
                                    fontSize: 10,
                                    color: secondaryLight,
                                  )),
                            ])),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Similar Products",
                          style: kLabelStyleBold.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            return state.map(
                              initial: (_) => LoadingUI(),
                              loading: (_) => LoadingUI(),
                              loaded: (res) => DailyNeed(
                                products: res.dailyNeeds!,
                                height: 250,
                              ),
                              error: (err) => Text(err.message),
                            );
                          },
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
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
                      imageUrl: widget.productModel.thumbnail!,
                      fit: BoxFit.fitHeight,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: _buildPageIndicator(counter),
        )
      ],
    );
  }
}
