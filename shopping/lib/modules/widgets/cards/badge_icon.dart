import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class BadgeIcon extends StatelessWidget {
  final String? text;
  final IconData icon;
  const BadgeIcon({
    super.key,
    this.icon = Icons.bookmark,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    var iconWidget = Icon(
      icon,
      color: Colors.red,
      shadows: const [BoxShadow(blurRadius: 1, spreadRadius: 0, offset: Offset(0, 1))],
    );
    return text == null
        ? iconWidget
        : Stack(alignment: Alignment.center, children: [
            iconWidget.fittedBox(48),
            Positioned(
              top: 8,
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 1, color: Colors.white),
              ).fittedBox(24),
            )
          ]);
  }
}
