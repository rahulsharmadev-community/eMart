import 'package:flutter/material.dart';
import 'package:ico/ico.dart';
import 'package:jars/jars.dart';
import 'package:shopping/utility/routes/app_routes.dart';

class WebNavigationRail extends StatefulWidget {
  const WebNavigationRail({super.key});

  @override
  State<WebNavigationRail> createState() => _WebNavigationRailState();
}

class _WebNavigationRailState extends State<WebNavigationRail> {
  int currentIndex = 0;

  List<(NavigationRailDestination, AppRoutes)> items = [
    (_navItem(Ico.home_outline, 'Home'), AppRoutes.HomeScreen),
    (_navItem(Ico.layout_outline, 'Categories'), AppRoutes.CategoriesScreen),
    (_navItem(Ico.box_outline, 'Orders'), AppRoutes.OrdersScreen),
    (_navItem(Ico.heart_outline, 'Wishlist'), AppRoutes.WishlistScreen),
    (_navItem(Ico.user_outline, 'Profile'), AppRoutes.ProfileScreen),
  ];
  onTap(int value) {
    items[value].$2.goNamed();
    setState(() => currentIndex = value);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformQueryBuilder(
      builder: (_) {
        var extended = PlatformQuery.returnSmartly(mobile: false, tablet: false, desktop: true);
        return NavigationRail(
          extended: extended,
          selectedLabelTextStyle: context.textTheme.bodyMedium
              ?.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w600),
          destinations: items.map((e) => e.$1).toList(),
          selectedIndex: currentIndex,
          onDestinationSelected: onTap,
          useIndicator: true,
        );
      },
    );
  }
}

NavigationRailDestination _navItem(IconData icon, String label) =>
    NavigationRailDestination(icon: Icon(icon), label: Text(label).fontSize(14));
