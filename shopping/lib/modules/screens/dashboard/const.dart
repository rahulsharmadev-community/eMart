import 'package:flutter/material.dart';
import 'package:ico/ico.dart';

import 'package:shopping/utility/routes/app_routes.dart';

const items = [
  _Item('Home', Ico.home_outline, AppRoutes.HomeScreen),
  _Item('Categories', Ico.layout_outline, AppRoutes.CategoriesScreen),
  _Item('Orders', Ico.box_outline, AppRoutes.OrdersScreen),
  _Item('Wishlist', Ico.heart_outline, AppRoutes.WishlistScreen),
  _Item('Profile', Ico.user_outline, AppRoutes.ProfileScreen)
];

class _Item {
  final String title;
  final IconData icon;
  final AppRoutes route;
  const _Item(this.title, this.icon, this.route);
}
