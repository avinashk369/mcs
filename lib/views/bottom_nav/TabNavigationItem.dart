import 'package:flutter/material.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/bottom_nav/dashboard/pages/mobile/home_screen.dart';
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
          page: const UserSettings(),
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.grey,
          ),
          title: food,
          selectedIcon: const Icon(
            Icons.settings,
            color: secondaryLight,
          ),
        ),
      ];
}
