import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/productbloc.dart';
import 'package:mcs/models/models.dart';
import 'package:mcs/routes/route_constants.dart';
import 'package:mcs/utils/product_dialog_util.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/food/food_screen.dart';
import 'package:mcs/views/factories/prodcut/product_list_interface.dart';
import 'package:mcs/views/factories/prodcut/product_type_enums.dart';
import 'package:mcs/widgets/loading_ui.dart';

class RestaurantProductScreen extends StatelessWidget {
  static const String tag = restaurantProduct;
  const RestaurantProductScreen({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                searchHint: ["Search in ${restaurantModel.categoryName}"]),
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
                        /// add products into pref for local storage
                        PreferenceUtils.clearCart(cartItems)!.then((value) => {
                              PreferenceUtils.putString(
                                  cartItems,
                                  product
                                      .copyWith(count: 1)
                                      .toJson()
                                      .toString())
                            });

                        context.read<ProductBloc>().add(AddProduct(
                            productModel: product.copyWith(count: 1),
                            isCart: false));
                      },
                      removeFromCart: (product) {
                        /// remove product from pref
                        PreferenceUtils.clearCart(cartItems);
                        context.read<ProductBloc>().add(DeleteProduct(product));
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
                                isCart: false));
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                      products: value.products,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
