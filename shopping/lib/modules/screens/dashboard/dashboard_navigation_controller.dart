import 'package:flutter/material.dart' hide Route;
import 'package:ico/ico.dart';
import 'package:jars/jars.dart';
import 'package:shopping/utility/routes/routers_config.dart';
import 'package:shopping/utility/routes/routes_initialise.dart';

final items = [
  _Item('Home', Ico.home_outline, AppRoutes.HomeRoute),
  _Item('Categories', Ico.layout_outline, AppRoutes.CategoriesRoute),
  _Item('Cart', Ico.shopping_cart_outline, AppRoutes.CartRoute),
  _Item('Wishlist', Ico.heart_outline, AppRoutes.WishlistRoute),
  _Item('Profile', Ico.user_outline, AppRoutes.ProfileRoute)
];

class _Item {
  final String title;
  final IconData icon;
  final Route route;
  const _Item(this.title, this.icon, this.route);
}

class DashboardNavigationController {
  DashboardNavigationController._();
  static final instance = DashboardNavigationController._();

  int lastIndex = 0;

  int get selectedIndex {
    final String location = AppRouterConfig.instance.currentConfig.uri.toString();
    var result = items.firstWhereOrNull((e) => location.startsWith('/${e.route.name}'));

    if (result == null) return lastIndex;

    return lastIndex = items.indexOf(result);
  }
}
