import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'badge_icon.dart';
part 'base_item_cart.dart';

enum ItemCardType { vertical, horizontal }

class ItemCard extends _ItemCard {
  final BadgeIcon? badge;
  final ItemCardType type;

  const ItemCard(this.type,
      {super.key,
      required super.content,
      required super.leading,
      this.badge,
      super.width,
      required super.height,
      super.bannerMsg,
      super.bannerLocation,
      super.bannerColor,
      super.bannerTextStyle,
      super.color,
      super.shadowColor,
      super.surfaceTintColor,
      super.shape,
      super.labels,
      super.labelAlignment,
      super.actions,
      super.margin,
      super.labelPadding = const EdgeInsets.fromLTRB(8, 8, 8, 0),
      super.contentPadding = const EdgeInsets.fromLTRB(8, 0, 8, 8),
      super.leadingPadding,
      super.actionsPadding,
      super.actionsAlignment,
      super.elevation})
      : assert(height != null, 'height should not be `null`');

  @override
  Widget build(BuildContext context) {
    Widget child;
    child = (type == ItemCardType.vertical) ? buildVerticalLayout() : buildHorizontalLayout();

    return buildItemCard(child);
  }

  LayoutBuilder buildHorizontalLayout() {
    return LayoutBuilder(builder: (context, constraints) { /// Usefull only for web
      bool fix = constraints.maxWidth * 0.4 > 300;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: fix ? 0 : 2,
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300), child: leading.padding(leadingPadding)),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (labels != null)
                  _buildRowWidgets(labels!, labelPadding, 24, labelAlignment ?? MainAxisAlignment.end),
                content.padding(contentPadding),
                const Spacer(),
                if (actions?.isNotEmpty ?? false)
                  _buildRowWidgets(
                      actions!, actionsPadding, kToolbarHeight, actionsAlignment ?? MainAxisAlignment.center)
              ],
            ),
          ),
        ],
      );
    });
  }

  Column buildVerticalLayout() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height! * 0.5,
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              leading.padding(leadingPadding),
              if (labels != null)
                _buildRowWidgets(
                    labels!, labelPadding, height! * 0.04, labelAlignment ?? MainAxisAlignment.end),
              if (badge != null)
                Positioned(
                    top: -6,
                    right: bannerLocation == BannerLocation.topEnd ? null : 4,
                    left: bannerLocation == BannerLocation.topEnd ? 4 : null,
                    child: badge!),
            ],
          ),
        ),
        content.padding(contentPadding),
        const Spacer(),
        if (actions?.isNotEmpty ?? false)
          _buildRowWidgets(
              actions!, actionsPadding, kToolbarHeight, actionsAlignment ?? MainAxisAlignment.center)
      ],
    );
  }
}

/// __Helper widget
Widget _buildRowWidgets(List<Widget> children, EdgeInsetsGeometry? padding, double maxHeight,
    MainAxisAlignment mainAxisAlignment) {
  var constraints = BoxConstraints(maxHeight: maxHeight);
  return ConstrainedBox(
    constraints: constraints,
    child: Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children
          .map((e) => e is Flexible ? e : ConstrainedBox(constraints: constraints, child: e))
          .toList(),
    ).padding(padding),
  );
}