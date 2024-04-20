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
  final String thumbnail;
  final String title;
  final String? shotDescription;
  final String? productBrand;
  final String mrp;
  final String discountedPrice;
  final List<String> imageUrls;
  final List<Variant> variants;
  final List<String>? feature;
  final JSON<String> detailedSpecs;
  final String discount;
  final double rating;
  final String totalReviews;
  final VoidCallback? onCart;
  final VoidCallback? onBuy;
  final List<Widget>? children;

  const _MobileProductScreen({
    super.key,
    this.feature,
    required this.mrp,
    required this.thumbnail,
    required this.title,
    this.shotDescription,
    this.productBrand,
    required this.imageUrls,
    required this.variants,
    required this.detailedSpecs,
    required this.discount,
    required this.discountedPrice,
    required this.rating,
    required this.totalReviews,
    this.onCart,
    this.onBuy,
    this.children,
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
    final List<Widget> children = _createChildren();
    Widget separatorBuilder(context, i) => i > 0 ? 16.gap : 4.gap;
    Widget itemBuilder(context, i) => children[i];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarBuilder(
        onBuy: widget.onBuy,
        onCart: widget.onCart,
      ),
      appBar: MobileSearchAppBar(
          bottom: BottomAppBarBuilder(
        isScrolOnTop: isScrolOnTop,
        image: widget.thumbnail,
        title: widget.title,
        rating: widget.rating,
        totalReviews: widget.totalReviews,
        productBrand: widget.productBrand,
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

  List<Widget> _createChildren() {
    return [
      MultiImageViewBuilder(
        imageUrls: widget.imageUrls,
        variants: widget.variants,
      ),
      PriceBuilder(
        discount: widget.discount,
        mrp: widget.mrp,
        discountedPrice: widget.discountedPrice,
      ).paddingHorizontal(12),
      if (widget.feature?.isNotEmpty ?? false) FeaturesBuilder(widget.feature!).paddingHorizontal(12),
      if (widget.shotDescription != null) DescriptionBuilder(widget.shotDescription!).paddingHorizontal(12),
      if (widget.detailedSpecs.isNotEmpty) DetailedSpecsBuilder(widget.detailedSpecs).paddingHorizontal(12),
      if (widget.children != null) ...widget.children!
    ];
  }
}
