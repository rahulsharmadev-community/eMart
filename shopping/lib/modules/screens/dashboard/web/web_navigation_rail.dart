import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shopping/modules/screens/dashboard/const.dart';

class WebNavigationRail extends StatefulWidget {
  const WebNavigationRail({super.key});

  @override
  State<WebNavigationRail> createState() => _WebNavigationRailState();
}

class _WebNavigationRailState extends State<WebNavigationRail> {
  int currentIndex = 0;

  onTap(int value) {
    items[value].route.goNamed();
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
          destinations: items.map((e) => _navItem(e.icon, e.title)).toList(),
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
