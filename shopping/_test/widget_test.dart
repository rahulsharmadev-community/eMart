// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jars/jars.dart';

import 'package:shared/models.dart';
import 'package:shopping/modules/screens/product_screen/product_screen.dart';

import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/modules/widgets/product_cards/product_card.dart';

import '../lib/modules/screens/product_screen/data.dart';

var testProduct = jsonDATA.map((e) => Product.fromJson(e)).toList();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProductScreen(''));
  }
}
