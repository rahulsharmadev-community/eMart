// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'mobile_appbar.dart';
import 'package:shopping/modules/screens/dashboard/dashboard_navigation_controller.dart';

class eMartMobileDashBoard extends StatelessWidget {
  final Widget child;

  const eMartMobileDashBoard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MobileAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: DashboardNavigationController.instance.selectedIndex,
        items: items.map((e) => navItem(e.icon, e.title)).toList(),
        onTap: (_) => items[_].route.goNamed(),
      ),
      body: child,
    );
  }

  BottomNavigationBarItem navItem(IconData icon, String label) =>
      BottomNavigationBarItem(icon: Icon(icon), label: label);
}
