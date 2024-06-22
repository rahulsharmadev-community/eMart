import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class CustomCard extends StatelessWidget {
  final String imgSrc, title, substitle;
  const CustomCard({super.key, required this.imgSrc, required this.title, required this.substitle});

  @override
  Widget build(BuildContext context) {
    var shapeDecoration = ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      shadows: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
    );
    var theme = Theme.of(context).primaryTextTheme;
    return Container(
      width: 275,
      padding: const EdgeInsets.symmetric(vertical: 16),
      clipBehavior: Clip.hardEdge,
      decoration: shapeDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(imgSrc),
          12.gap,
          Column(
            children: [
              Text(title, style: theme.titleMedium),
              4.gap,
              Text(substitle, style: theme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
