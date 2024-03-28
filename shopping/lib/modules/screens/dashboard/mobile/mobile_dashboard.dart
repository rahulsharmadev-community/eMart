// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:ico/ico.dart';
import 'package:shopping/utility/utility.dart';


class eMartMobileDashBoard extends StatefulWidget {
  final Widget child;
  const eMartMobileDashBoard({super.key, required this.child});

  @override
  State<eMartMobileDashBoard> createState() => _eMartMobileDashBoardState();
}

class _eMartMobileDashBoardState extends State<eMartMobileDashBoard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<(BottomNavigationBarItem, AppRoutes)> items = [
      (navItem(Ico.home_outline, 'Home'), AppRoutes.HomeScreen),
      (navItem(Ico.layout_outline, 'Categories'), AppRoutes.CategoriesScreen),
      (navItem(Ico.box_outline, 'Orders'), AppRoutes.OrdersScreen),
      (navItem(Ico.book_mark_outline, 'Wishlist'), AppRoutes.WishlistScreen),
      (navItem(Ico.user_outline, 'Profile'), AppRoutes.ProfileScreen),
    ];
    onTap(int value) {
      items[value].$2.goNamed();
      setState(() => currentIndex = value);
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items.map((e) => e.$1).toList(),
        onTap: onTap,
      ),
      body: widget.child,
    );
  }

  BottomNavigationBarItem navItem(IconData icon, String label) =>
      BottomNavigationBarItem(icon: Icon(icon), label: label);
}
