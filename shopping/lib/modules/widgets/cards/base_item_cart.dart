part of 'item_card.dart';

const double _kHeight = 12.0; // height of banner
const Color _kColor = Color(0xA0B71C1C);
const TextStyle _kTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: _kHeight * 0.85,
  fontWeight: FontWeight.w900,
  height: 1.0,
);

abstract class _ItemCard extends StatelessWidget {
  final double leadingFactor;
  final String? bannerMsg;
  final BannerLocation? bannerLocation;
  final Color bannerColor;
  final TextStyle bannerTextStyle;
  final Color? color, shadowColor, surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final List<Widget>? labels;
  final MainAxisAlignment? labelAlignment;
  final Widget leading;
  final Widget content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment? actionsAlignment;
  final double? width;
  final double? height;

  const _ItemCard(
      {required super.key,
      required this.bannerMsg,
      required this.bannerLocation,
      this.bannerColor = _kColor,
      this.bannerTextStyle = _kTextStyle,
      required this.color,
      this.leadingFactor = 0.4,
      required this.shadowColor,
      required this.surfaceTintColor,
      required this.shape,
      required this.labels,
      required this.labelAlignment,
      required this.leading,
      required this.content,
      required this.actions,
      required this.margin,
      required this.contentPadding,
      required this.leadingPadding,
      required this.actionsPadding,
      required this.actionsAlignment,
      required this.width,
      required this.height,
      required this.elevation,
      required this.labelPadding});

  Widget buildItemCard(Widget child) {
    child = bannerMsg.ifNotNull(
        def: child,
        callback: (_) => Banner(
            message: _,
            location: bannerLocation ?? BannerLocation.topStart,
            color: bannerColor,
            textStyle: bannerTextStyle,
            child: child));

    child = Card(
      clipBehavior: Clip.hardEdge,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      margin: margin,
      borderOnForeground: false,
      child: child,
    );

    return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width ?? double.maxFinite,
          maxHeight: height ?? double.maxFinite,
        ),
        child: child);
  }
}
