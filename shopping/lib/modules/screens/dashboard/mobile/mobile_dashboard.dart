// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shopping/modules/screens/dashboard/const.dart';

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
    onTap(int value) {
      items[value].route.goNamed();
      setState(() => currentIndex = value);
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items.map((e) => navItem(e.icon, e.title)).toList(),
        onTap: onTap,
      ),
      body: widget.child,
    );
  }

  BottomNavigationBarItem navItem(IconData icon, String label) =>
      BottomNavigationBarItem(icon: Icon(icon), label: label);
}
