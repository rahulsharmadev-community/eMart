import 'package:flutter/material.dart';

import 'package:jars/jars.dart';

class DefaultButton extends StatelessWidget {
  final Badge? badge;
  final AlignmentGeometry? alignment;
  final String text;
  final void Function()? onPressed;
  final bool filledTone;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? iconSize;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;

  const DefaultButton(
    this.text, {
    super.key,
    this.badge,
    this.filledTone = false,
    this.onPressed,
    this.trailingIcon,
    this.leadingIcon,
    this.alignment,
    this.iconSize,
    this.padding,
    this.margin,
    this.borderRadius,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    child = buildButtonLayout(context);
    var styleFrom = FilledButton.styleFrom(
      padding: padding,
      textStyle: style ?? context.textTheme.titleMedium,
      shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.zero),
      fixedSize: const Size.fromHeight(double.maxFinite),
      minimumSize: const Size.fromHeight(double.maxFinite),
    );
    child = !filledTone
        ? FilledButton(style: styleFrom, onPressed: onPressed, child: child)
        : FilledButton.tonal(style: styleFrom, onPressed: onPressed, child: child);

    if (badge != null) {
      child = Stack(alignment: alignment ?? AlignmentDirectional.topEnd, children: [child, badge!]);
    }

    return child.padding(margin);
  }

  Widget buildButtonLayout(BuildContext context) {
    if (leadingIcon != null || trailingIcon != null) {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        if (leadingIcon != null) Icon(leadingIcon, size: iconSize).paddingOnly(right: 4),
        Text(text),
        if (trailingIcon != null) Icon(trailingIcon, size: iconSize).paddingOnly(left: 4),
      ]);
    } else {
      return Text(text);
    }
  }
}
