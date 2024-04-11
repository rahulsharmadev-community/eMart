import 'package:flutter/material.dart';
import 'package:ico/ico.dart';
import 'package:jars/jars.dart';
import '../dashboard_navigation_controller.dart';

class WebNavigationRail extends StatelessWidget {
// ignore: prefer_const_constructors_in_immutables
  WebNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    var extended = PlatformQuery.returnSmartly(mobile: false, tablet: false, desktop: true);
    return NavigationRail(
      extended: extended,
      trailing: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [IconButton(onPressed: () {}, icon: const Icon(Ico.setting_star_outline))],
          ),
        ),
      ),
      selectedLabelTextStyle: context.textTheme.bodyMedium
          ?.copyWith(color: context.theme.primaryColor, fontWeight: FontWeight.w600),
      destinations: items.map((e) => _navItem(e.icon, e.title)).toList(),
      selectedIndex: DashboardNavigationController.instance.selectedIndex,
      onDestinationSelected: (i) {
        items[i].route.goNamed();
      },
      useIndicator: true,
    );
  }
}

NavigationRailDestination _navItem(IconData icon, String label) =>
    NavigationRailDestination(icon: Icon(icon), label: Text(label).fontSize(14));
