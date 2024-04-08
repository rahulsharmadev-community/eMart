import 'alert_model.dart';
import 'alert_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jars/jars.dart';

class AlertBanner extends StatelessWidget {
  final AlertModel model;
  final void Function()? onClose;
  final void Function(String?)? onAction;
  const AlertBanner({super.key, required this.model, this.onClose, this.onAction});
  AlertContent get ctx => model.content;

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
      margin: EdgeInsets.symmetric(horizontal: model.decoration ? 8 : 0),
      child: Row(
        children: [
          if (model.prefixIcon != null) _buildIcon(model.prefixIcon!).paddingOnly(left: 8),
          if (child != null) Expanded(child: child.paddingHorizontal(8)),
          if (model.showCloseButton != null) CloseButton(onPressed: onClose).paddingOnly(right: 8),
        ],
      ),
    );
  }

  BoxDecoration _getDecoration() {
    var image = ctx.imageUrl == null
        ? null
        : DecorationImage(image: Image.network(ctx.imageUrl!).image, fit: BoxFit.cover);
    return BoxDecoration(
        border: model.border && model.decoration ? Border.all() : null,
        borderRadius: model.decoration ? BorderRadius.circular(8) : null,
        color: model.backgroundColor,
        image: image);
  }

  Widget _buildButtons(BuildContext content) {
    return Row(
      mainAxisAlignment: ctx.buttonAlignment ?? MainAxisAlignment.end,
      children: ctx.buttons!
          .map((e) => AlertButtonWidget(e, onPressed: () => onAction!(e.returnOnPressed)))
          .toList(),
    );
  }

  Icon _buildIcon(IconModel icon) => Icon(
        IconData(icon.codePoint, fontFamily: icon.fontFamily ?? 'MaterialIcons'),
        color: icon.color,
      );
}
