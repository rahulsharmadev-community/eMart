// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class AlertButtonWidget extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  final Color? textColor;
  final Color? backgroundColor;
  final String? returnOnPressed;
  final bool isOutlineButton;
  final void Function()? onPressed;
  const AlertButtonWidget(
      {super.key,
      this.onPressed,
      this.text,
      this.imageUrl,
      this.textColor,
      this.backgroundColor,
      this.returnOnPressed,
      required this.isOutlineButton});

  bool get imageExist => imageUrl != null && imageUrl!.isNotEmpty;

  ButtonStyle get style =>
      ElevatedButton.styleFrom(minimumSize: Size.zero, padding: const EdgeInsets.fromLTRB(10, 12, 10, 12));

  @override
  Widget build(BuildContext context) {
    Text? textWidget =
        ifNotNull(text, (_) => Text(_, style: context.textTheme.labelMedium?.copyWith(color: textColor)));

    if (imageExist) {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        constraints: const BoxConstraints(
          minWidth: 65,
          maxWidth: 100,
          minHeight: 28,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(500),
            image: ifNotNull(
                imageUrl, (_) => DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(_)))),
        child: textWidget,
      );
    }

    return isOutlineButton
        ? OutlinedButton(style: style, onPressed: onPressed, child: textWidget)
        : ElevatedButton(style: style, onPressed: onPressed, child: textWidget);
  }
}
