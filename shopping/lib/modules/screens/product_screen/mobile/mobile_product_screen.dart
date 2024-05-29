part of '../product_screen.dart';
// ignore_for_file: unused_element

class Variant {
  final String title, thumbnail;
  final VoidCallback? onPressed;
  const Variant({
    required this.title,
    required this.thumbnail,
    this.onPressed,
  });
}

class _MobileProductScreen extends StatefulWidget {
  final model.Product product;
  final List<Widget>? children;

  const _MobileProductScreen({
    super.key,
    this.children,
    required this.product,
  });

  @override
  State<_MobileProductScreen> createState() => _MobileProductScreenState();
}

class _MobileProductScreenState extends State<_MobileProductScreen> {
  late final ScrollController scrollController;
  late final ValueNotifier<bool> isScrolOnTop;

  @override
  void initState() {
    isScrolOnTop = ValueNotifier(true);
    var limit = PlatformQuery.height / 2;
    scrollController = ScrollController()
      ..addListener(() {
        var newValue = scrollController.offset < limit;
        if (isScrolOnTop.value != newValue) {
          isScrolOnTop.value = newValue;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isScrolOnTop.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      MultiImageViewBuilder(widget.product.imageUrls),
      PriceBuilder(
        discount: widget.product.discount,
        mrp: widget.product.mrp,
        discountedPrice: widget.product.discountedPrice,
      ).paddingHorizontal(12),
      if (widget.product.feature?.isNotEmpty ?? false)
        FeaturesBuilder(widget.product.feature!).paddingHorizontal(12),
      if (widget.product.shotDescription != null)
        DescriptionBuilder(widget.product.shotDescription!).paddingHorizontal(12),
      if (widget.product.detailedSpecs.isNotEmpty)
        DetailedSpecsBuilder(widget.product.detailedSpecs).paddingHorizontal(12),
      if (widget.children != null) ...widget.children!
    ];
    Widget separatorBuilder(context, i) => i > 0 ? 16.gap : 4.gap;
    Widget itemBuilder(context, i) => children[i];

    return Scaffold(
      bottomNavigationBar: ActionButtonsBuilder(product: widget.product),
      appBar: MobileSearchAppBar(
          bottom: BottomAppBarBuilder(
        product: widget.product,
        isScrolOnTop: isScrolOnTop,
        onTap: () => scrollController.animateTo(0, duration: 300.milliseconds, curve: Curves.decelerate),
      )),
      body: ListView.separated(
        controller: scrollController,
        itemCount: children.length,
        separatorBuilder: separatorBuilder,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
