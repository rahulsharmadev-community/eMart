// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:shopping/modules/screens/dashboard/web/web_navigation_rail.dart';
import 'package:shopping/modules/screens/search_screen/web/search_keyword_textfield.dart';

class eMartWebDashBoard extends StatelessWidget {
  final Widget child;
  const eMartWebDashBoard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WebNavigationRail(),
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: const SearchKeywordTextField(),
              ),
              body: child),
        ),
      ],
    );
  }
}
