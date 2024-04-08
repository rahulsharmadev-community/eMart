import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImplicitGridCard extends StatelessWidget {
  final String? label;
  final String imageUrl;
  final double width;
  final int maxLines;
  final VoidCallback? onTap;

  final EdgeInsetsGeometry? margin;
  const ImplicitGridCard(
      {super.key,
      this.label,
      this.imageUrl = "https://via.placeholder.com/56x56",
      required this.width,
      this.maxLines = 2,
      this.margin = const EdgeInsets.symmetric(horizontal: 4),
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(imageUrl: imageUrl, width: width, height: width, fit: BoxFit.fill),
            if (label != null) Center(child: textWidget(context)),
          ],
        ),
      ),
    );
  }

  Text textWidget(BuildContext context) {
    return Text(label!,
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.labelMedium);
  }
}
