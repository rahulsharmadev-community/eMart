// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:shopping/modules/screens/dashboard/web/web_navigation_rail.dart';

class eMartWebDashBoard extends StatelessWidget {
  final Widget child;
  const eMartWebDashBoard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const WebNavigationRail(), Expanded(child: child)],
    );
  }
}
