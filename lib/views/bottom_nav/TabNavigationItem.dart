import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/cart/shopping_cart.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
import 'package:mcs/views/bottom_nav/food/food_screen.dart';
import 'package:mcs/views/user/user_settings.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;
  final Icon selectedIcon;

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomeScreen(),
          icon: const Icon(
            Icons.home_outlined,
            color: Colors.grey,
          ),
          title: home,
          selectedIcon: const Icon(
            Icons.home,
            color: secondaryLight,
          ),
        ),
        TabNavigationItem(
          page: const FoodScreen(),
          icon: const Icon(
            Icons.food_bank_outlined,
            color: Colors.grey,
          ),
          title: food,
          selectedIcon: const Icon(
            Icons.food_bank,
            color: secondaryLight,
          ),
        ),
        TabNavigationItem(
          page: const UserSettings(),
          icon: const Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
          title: settings,
          selectedIcon: const Icon(
            Icons.person,
            color: secondaryLight,
          ),
        ),
        TabNavigationItem(
          page: const ShoppingCart(),
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey,
          ),
          title: cart,
          selectedIcon: const Icon(
            Icons.shopping_cart,
            color: secondaryLight,
          ),
        ),
      ];
}
