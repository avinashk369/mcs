import 'package:flutter/material.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/auth/verification/screens/user_verification.dart';
import 'package:mcs/views/bottom_nav/cart/checkout_screen.dart';
import 'package:mcs/views/bottom_nav/dashboard/dashboard.dart';
import 'package:mcs/views/bottom_nav/product/product_detail.dart';
import 'package:mcs/views/bottom_nav/product/product_list.dart';
import 'package:mcs/views/welcome.dart';

import 'route_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case homeRoute:
        //SplashView()
        return SlideRightRoute(page: const Welcome());
      // case loginRoute:
      //   return SlideRightRoute(page: LoginView());
      case dashboardRoute:
        return SlideRightRoute(
          page: Dashboard(
            message: args as String,
          ),
        );
      case products:
        Map<String, dynamic> data = args as Map<String, dynamic>;
        CategoryModel categoryModel = data['category'];
        int index = data['index'];

        return SlideRightRoute(
          page: ProductList(
            category: categoryModel,
            index: index,
          ),
        );
      case productDetail:
        return SlideRightRoute(
          page: ProductDetail(productModel: args as ProductModel),
        );
      case checkout:
        return SlideRightRoute(
          page: CheckoutScreen(products: args as List<ProductModel>),
        );
      case otpRoute:
        Map<String, dynamic> data = args as Map<String, dynamic>;
        String token = data['token'];
        String mobile = data['mobile'];
        return SlideRightRoute(
          page: UserVerification(
            token: token,
            mobile: mobile,
          ),
        );

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
