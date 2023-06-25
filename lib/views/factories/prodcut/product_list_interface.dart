library product_list_interface;

import 'package:flutter/material.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/theme_constants.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
import 'package:mcs/views/bottom_nav/food/food_screen.dart';
import 'package:mcs/views/factories/prodcut/product_type_enums.dart';
import 'package:mcs/widgets/dashed_separator.dart';
part 'grocery_product_list.dart';
part 'product_factory.dart';
part 'food_product_list.dart';

abstract class ProductListInterface {
  factory ProductListInterface(ProductType productType) {
    switch (productType) {
      case ProductType.grocery:
        return GroceryProductList();
      case ProductType.food:
        return FoodProductList();
      default:
        throw Exception("Invalid Product Type");
    }
  }
  Widget build({
    required Function(ProductModel productModel) addToCart,
    required Function(ProductModel productModel) removeFromCart,
    Function(ProductModel productModel, ProductState state)? showAddOn,
    required List<ProductModel> products,
  });
}
