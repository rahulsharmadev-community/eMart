import 'package:flutter/material.dart';
class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [

    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, i) => children[i],
      ),
    );
  }
}
