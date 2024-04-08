// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:banner/com.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'alert_model.dart';

class AlertButtonWidget extends StatelessWidget {
  final AlertButton model;
  final void Function()? onPressed;
  const AlertButtonWidget(this.model, {super.key, this.onPressed});

  bool get imageExist => model.imageUrl != null && model.imageUrl!.isNotEmpty;

  ButtonStyle get style => ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      );

  @override
  Widget build(BuildContext context) {
    Text? textWidget = ifNotNull(
        model.text, (_) => Text(_, style: context.textTheme.labelMedium?.copyWith(color: model.textColor)));

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
            color: model.backgroundColor,
            borderRadius: BorderRadius.circular(500),
            image: ifNotNull(model.imageUrl,
                (_) => DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(_)))),
        child: textWidget,
      );
    }

    return model.isOutlineButton
        ? OutlinedButton(style: style, onPressed: onPressed, child: textWidget)
        : ElevatedButton(style: style, onPressed: onPressed, child: textWidget);
  }
}
