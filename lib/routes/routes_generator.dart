import 'package:flutter/material.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/auth/verification/screens/user_verification.dart';
import 'package:mcs/views/bottom_nav/cart/checkout_screen.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';
import 'package:mcs/views/bottom_nav/product/product_detail.dart';
import 'package:mcs/views/bottom_nav/product/product_list.dart';
import 'package:mcs/views/order/order_history.dart';
import 'package:mcs/views/welcome.dart';

import '../views/bottom_nav/product/search/product_search_screen.dart';
import 'route_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case Welcome.tag:
        //SplashView()
        return SlideRightRoute(page: const Welcome());
      // case loginRoute:
      //   return SlideRightRoute(page: LoginView());
      case Dashboard.tag:
        return SlideRightRoute(
          page: const Dashboard(),
        );
      case ProductList.tag:
        Map<String, dynamic> data = args as Map<String, dynamic>;
        CategoryModel categoryModel = data['category'];
        int index = data['index'];
        String cityId = data['city_id'];

        return SlideRightRoute(
          page: ProductList(
            category: categoryModel,
            index: index,
            cityId: cityId,
          ),
        );
      case productDetail:
        return SlideRightRoute(
          page: ProductDetail(productModel: args as ProductModel),
        );
      case ProductSearchScreen.tag:
        return SlideRightRoute(page: ProductSearchScreen());
      case CheckoutScreen.tag:
        Map<String, dynamic> data = args as Map<String, dynamic>;
        List<ProductModel> products = data['products'];
        double shippingChrage = data['shipping_charge'];
        return SlideRightRoute(
          page: CheckoutScreen(
            products: products,
            shippingCharge: shippingChrage,
          ),
        );
      case UserVerification.tag:
        Map<String, dynamic> data = args as Map<String, dynamic>;
        int token = data['token'];
        String mobile = data['mobile_no'];
        return SlideRightRoute(
          page: UserVerification(
            token: token.toString(),
            mobile: mobile,
          ),
        );
      case OrderHistory.tag:
        return SlideRightRoute(page: const OrderHistory());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
