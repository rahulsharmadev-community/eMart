import 'package:repositories/repositories.dart';
import 'alert_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jars/jars.dart';

class AlertBanner extends StatelessWidget {
  final AlertContent content;
  final Color? backgroundColor;
  final IconModel? prefixIcon;
  final bool? showCloseButton;
  final DateTime expiry;
  final bool decoration;
  final bool border;
  final void Function()? onClose;
  final void Function(String?)? onAction;
  const AlertBanner(
      {super.key,
      this.onClose,
      this.onAction,
      required this.content,
      this.backgroundColor,
      this.prefixIcon,
      this.showCloseButton,
      required this.expiry,
      required this.decoration,
      required this.border});
  AlertContent get ctx => content;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (ctx.isOnyImage) {
      child = CachedNetworkImage(
        imageUrl: ctx.imageUrl!,
        fit: BoxFit.cover,
        height: kToolbarHeight,
        width: MediaQuery.of(context).size.width,
      );
      if (ctx.isMarquee) child = Marquee(widget: child, velocity: 25);
      return child;
    }

    if (ctx.text != null) {
      child = Text(
        ctx.text!,
        maxLines: ctx.isMarquee ? 1 : ctx.maxLines,
        overflow: ctx.maxLines != null ? TextOverflow.ellipsis : null,
        style: context.textTheme.labelMedium,
      );
    }

    if (!ctx.isMarquee && ctx.buttons != null && ctx.buttons!.isNotEmpty) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [child!, _buildButtons(context)],
      );
    }

    if (ctx.isMarquee) child = Marquee(widget: child, blankSpace: 32, velocity: 25);

    return Container(
      decoration: _getDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: decoration ? 8 : 0),
      child: Row(
        children: [
          if (prefixIcon != null) _buildIcon(prefixIcon!).paddingOnly(left: 8),
          if (child != null) Expanded(child: child.paddingHorizontal(8)),
          if (showCloseButton != null) CloseButton(onPressed: onClose).paddingOnly(right: 8),
        ],
      ),
    );
  }

  BoxDecoration _getDecoration() {
    var image = ctx.imageUrl == null
        ? null
        : DecorationImage(image: Image.network(ctx.imageUrl!).image, fit: BoxFit.cover);
    return BoxDecoration(
        border: border && decoration ? Border.all() : null,
        borderRadius: decoration ? BorderRadius.circular(8) : null,
        color: backgroundColor,
        image: image);
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: ctx.buttonAlignment ?? MainAxisAlignment.end,
      children: ctx.buttons!.map((e) {
        return AlertButtonWidget(
            text: e.text,
            imageUrl: e.imageUrl,
            textColor: content.textColor,
            backgroundColor: e.backgroundColor,
            returnOnPressed: e.returnOnPressed,
            isOutlineButton: e.isOutlineButton,
            onPressed: () => onAction!(e.returnOnPressed));
      }).toList(),
    );
  }

  Icon _buildIcon(IconModel icon) => Icon(
        IconData(icon.codePoint, fontFamily: icon.fontFamily ?? 'MaterialIcons'),
        color: icon.color,
      );
}
