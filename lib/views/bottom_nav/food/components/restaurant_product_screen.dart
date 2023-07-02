import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/navigation/navigation_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/blocs/toggle/index_toggled.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/product_dialog_util.dart';
import 'package:mcs/utils/product_filter_enums.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/food/food_screen.dart';
import 'package:mcs/views/bottom_nav/product/search/product_search_screen.dart';
import 'package:mcs/views/factories/prodcut/product_list_interface.dart';
import 'package:mcs/views/factories/prodcut/product_type_enums.dart';
import 'package:mcs/widgets/loading_ui.dart';

class RestaurantProductScreen extends StatelessWidget {
  static const String tag = restaurantProduct;
  const RestaurantProductScreen({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;
    bool isCart = false;
    if (state is ProductLoaded) {
      isCart = state.addedProducts!.isNotEmpty;
    }
    return BlocProvider(
      create: (context) => ToggleIndexBloc(
        const Toggled(index: -1, isSelected: true),
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .25,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              elevation: 0,
              bottom: FoodFilter(
                searchHint: ["Search in ${restaurantModel.categoryName}"],
                onFilter: (name, index) => context
                    .read<ProductBloc>()
                    .add(SortAndFilter(filterMap: filters(name))),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      AppBar(),
                      Text(
                        restaurantModel.categoryName!,
                        style: kLabelStyleBold.copyWith(fontSize: 20),
                      ),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 20),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) => state.maybeMap(
                      orElse: () => const SizedBox.shrink(),
                      loading: (value) => const LoadingUI(),
                      loaded: (value) => ProductFactory.buildList(
                        productType: ProductType.food,
                        addToCart: (product) {
                          /// check for addons product
                          print(
                              "${product.addOnStatus} addon ${product.variant!.where((element) => element.type == 'add_on')}");

                          /// add products into pref for local storage
                          PreferenceUtils.clearCart(cartItems)!
                              .then((value) => {
                                    PreferenceUtils.putString(
                                        cartItems,
                                        product
                                            .copyWith(count: 1)
                                            .toJson()
                                            .toString())
                                  });

                          context.read<ProductBloc>().add(AddProduct(
                              productModel: product.copyWith(count: 1),
                              isCart: false,
                              isFood: true));
                        },
                        removeFromCart: (product) {
                          /// remove addons product
                          /// remove product from pref
                          PreferenceUtils.clearCart(cartItems);
                          context
                              .read<ProductBloc>()
                              .add(DeleteProduct(product));
                        },
                        showAddOn: (productModel, state) =>
                            ProductDialogUtil.showVariantBottomSheet(
                          context: context,
                          variants: productModel.variant!
                              .where((element) => element.type != 'add_on')
                              .toList(),
                          state: state,
                          productModel: productModel,
                          addToCart: (productModel, index) {
                            context.read<ProductBloc>().add(UpdatePrice(
                                productModel:
                                    productModel.copyWith(index: index)));
                            if (state is ProductLoaded) {
                              context.read<ProductBloc>().add(AddProduct(
                                    productModel: productModel.copyWith(
                                        index: index, count: 1),
                                    isCart: false,
                                    isFood: true,
                                  ));
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        products: value.products,
                      ),
                    ),
                  ),
                  const SizedBox(height: kToolbarHeight + 20),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: isCart
            ? state.maybeMap(
                loaded: (res) => BottomSheetCart(
                    productList: res.addedProducts!,
                    onTap: () {
                      // Navigator.of(context)
                      //     .pushNamed(checkout, arguments: res.addedProducts);
                      // change the navigation to the cart page on home screen. index 2 is cart index, it can be changed
                      context
                          .read<NavigationBloc>()
                          .changeNavigation(cartIndex);
                      // pop the navigation stack to the home screen
                      Navigator.of(context).pop();
                    }),
                orElse: () => const SizedBox.shrink(),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Map<String, dynamic> filters(String filterName) {
    switch (filterName.toLowerCase()) {
      case 'veg':
        return {"sort": ProductFilterType.veg.filterName};
      case 'non-veg':
        return {"sort": ProductFilterType.nonVeg.filterName};
      case 'price-low':
        return {"sort": ProductFilterType.priceToLow.filterName};
      case 'price-high':
        return {"sort": ProductFilterType.priceToHigh.filterName};
      default:
        return {"sort": ''};
    }
  }
}
