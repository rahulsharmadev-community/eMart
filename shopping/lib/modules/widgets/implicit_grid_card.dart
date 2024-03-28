import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImplicitGridCard extends StatelessWidget {
  final String? label;
  final String imageUrl;
  final BoxDecoration? decoration;
  const ImplicitGridCard({
    super.key,
    this.label,
    this.decoration,
    this.imageUrl = "https://via.placeholder.com/56x56",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 80,
          clipBehavior: Clip.hardEdge,
          decoration: decoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(imageUrl: imageUrl, width: 56, height: 56, fit: BoxFit.fill).circleBox(),
              Center(child: textWidget()),
            ],
          ),
        ),
      ],
    );
  }

  Text textWidget() {
    return Text(
      label!,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
