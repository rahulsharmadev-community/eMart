import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    var ls = [
      'Shop details',
      'Create products',
      'Regular GSTIN',
      'Release product',
      'PAN card copy',
      'Bank account details'
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          const Text('Get started with online ordering'),
          8.gap,
          const Text('Please keep the documents ready for a smooth registration'),
          16.gap,
          GridView.builder(
              itemCount: ls.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 2,
              ),
              itemBuilder: (context, i) => item(ls[i])),
        ],
      ),
    );
  }

  Row item(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [const Icon(Icons.check_circle), 8.gap, Text(title)],
    );
  }
}
