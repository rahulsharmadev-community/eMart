import 'package:flutter/material.dart';

import 'package:jars/jars.dart';

enum JButtonType {
  elevated,
  filled,
  // ignore: constant_identifier_names
  filled_tonal,
  outlined,
  text,
}

class JButton extends StatelessWidget {
  final Badge? badge;
  final AlignmentGeometry? alignment;
  final String? text;
  final void Function()? onPressed;
  final JButtonType type;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? iconSize;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;

  const JButton({
    this.text,
    super.key,
    this.badge,
    this.type = JButtonType.filled,
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

    child = buildButton(styleFrom, child);

    if (badge != null) {
      child = Stack(alignment: alignment ?? AlignmentDirectional.topEnd, children: [child, badge!]);
    }

    return child.padding(margin);
  }

  Widget buildButton(ButtonStyle styleFrom, Widget child) {
    switch (type) {
      case JButtonType.filled:
        return FilledButton(style: styleFrom, onPressed: onPressed, child: child);
      case JButtonType.filled_tonal:
        return FilledButton.tonal(style: styleFrom, onPressed: onPressed, child: child);
      case JButtonType.elevated:
        return ElevatedButton(style: styleFrom, onPressed: onPressed, child: child);
      case JButtonType.outlined:
        return OutlinedButton(style: styleFrom, onPressed: onPressed, child: child);
      default:
        return TextButton(style: styleFrom, onPressed: onPressed, child: child);
    }
  }

  Widget buildButtonLayout(BuildContext context) {
    if ((leadingIcon != null || trailingIcon != null) && text != null) {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        if (leadingIcon != null) Icon(leadingIcon, size: iconSize).paddingOnly(right: 4),
        if (text != null) Text(text!),
        if (trailingIcon != null) Icon(trailingIcon, size: iconSize).paddingOnly(left: 4),
      ]);
    } else if (leadingIcon != null) {
      return Icon(leadingIcon, size: iconSize);
    } else if (trailingIcon != null) {
      return Icon(trailingIcon, size: iconSize);
    } else if (text != null) {
      return Text(text!);
    } else {
      return const SizedBox.shrink();
    }
  }
}
