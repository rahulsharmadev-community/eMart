// ignore_for_file: unused_element

part of '../product_screen.dart';

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
    Widget separatorBuilder(context, i) => i > 0 ? 8.gap : 0.gap;
    Widget itemBuilder(context, i) => children[i];
    return Scaffold(
      appBar: appbar(),
      bottomNavigationBar: widget.onCart == null && widget.onBuy == null
          ? null
          : SizedBox.fromSize(
              size: const Size.fromHeight(64),
              child: Row(
                children: [
                  if (widget.onCart != null)
                    DefaultButton(
                      'Add to Cart',
                      filledTone: true,
                      onPressed: widget.onCart,
                    ).tightFit(),
                  if (widget.onBuy != null)
                    DefaultButton(
                      'Buy Now',
                      onPressed: widget.onBuy,
                    ).tightFit(),
                ],
              ),
            ),
      body: ListView.separated(
        controller: scrollController,
        itemCount: children.length,
        separatorBuilder: separatorBuilder,
        itemBuilder: itemBuilder,
      ),
    );
  }

  MobileSearchAppBar appbar() {
    return MobileSearchAppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: InkWell(
            onTap: () => scrollController.animateTo(0, curve: Curves.decelerate, duration: 300.milliseconds),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                children: [
                  ValueListenableBuilder<bool>(
                      valueListenable: isScrolOnTop,
                      builder: (context, value, child) => AnimatedCrossFade(
                            duration: 300.milliseconds,
                            crossFadeState: CrossFadeState.values[value ? 0 : 1],
                            firstChild: const SizedBox.shrink(),
                            secondChild: CachedNetworkImage(
                              imageUrl: widget.thumbnail,
                              fit: BoxFit.cover,
                              width: kToolbarHeight,
                              height: kTextTabBarHeight,
                            ),
                          )),
                  4.gap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      brandAndRating(),
                      const Spacer(),
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ).tightFit()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _createChildren() {
    return [
      displayImageCardAndVariants(),
      priceDiscount().paddingHorizontal(12),
      if (widget.feature?.isNotEmpty ?? false) buildFeatures().paddingHorizontal(12),
      if (widget.shotDescription != null) buildDescription().paddingHorizontal(12),
      if (widget.detailedSpecs.isNotEmpty) buildDetailedSpecs().paddingHorizontal(12),
      if (widget.children != null) ...widget.children!
    ];
  }

  Widget buildDescription() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('DESCRIPTION', style: context.textTheme.titleMedium),
          4.gap,
          MarkdownBody(data: widget.shotDescription!)
        ],
      );

  Widget buildDetailedSpecs() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('DETAILED SPECS', style: context.textTheme.titleMedium),
          4.gap,
          MapToTableWidget(
              showBorder: true, data: [for (var e in widget.detailedSpecs.entries) (e.key, e.value)]),
        ],
      );

  Column buildFeatures() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('HIGHLIGHTS', style: context.textTheme.titleMedium),
        MapToTableWidget(
            padding: const EdgeInsets.only(left: 4), data: widget.feature!.map((e) => ('•', e)).toList()),
      ],
    );
  }

  Widget displayImageCardAndVariants() {
    var carouselOptions = CarouselOptions(aspectRatio: 1, viewportFraction: 1);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          options: carouselOptions,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            return CachedNetworkImage(
              width: context.screenSize.width,
              imageUrl: widget.imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
        if (widget.variants.isNotEmpty)
          SizedBox.fromSize(
            size: const Size.fromHeight(48 + 16),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: widget.variants.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: e.onPressed,
                      child: SizedBox(
                        width: kToolbarHeight,
                        height: 48 + 12,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                constraints: BoxConstraints.tight(const Size.square(48)),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: context.colorScheme.outline,
                                        strokeAlign: BorderSide.strokeAlignOutside),
                                    borderRadius: BorderRadius.circular(2)),
                                child: CachedNetworkImage(
                                  imageUrl: e.thumbnail,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => const Placeholder(),
                                )),
                            2.gap,
                            Text(e.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.labelMedium)
                                .tightFit(),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
      ],
    );
  }

  Widget brandAndRating() {
    var ratingBar = RatingBarIndicator(
      rating: widget.rating,
      itemSize: 12,
      itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
    );
    var label = context.textTheme.labelMedium;
    return Row(
      children: [
        if (widget.productBrand != null) Text("Brand: ${widget.productBrand!}").fontWeight(FontWeight.w500),
        const Spacer(),
        Text('${widget.rating} ', style: label),
        ratingBar,
        Text(' ${widget.totalReviews}', style: label?.copyWith(color: label.color?.withOpacity(.5))),
      ],
    );
  }

  Widget priceDiscount() {
    var titleMedium = context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal);
    var titleLarge = context.textTheme.titleLarge;
    var dp = widget.discountedPrice;
    var mrp = '${widget.mrp}\n';
    var dis = '${widget.discount}% OFF';
    return SizedBox(
      height: kToolbarHeight,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Text.rich(
          TextSpan(
            text: dp,
            style: context.textTheme.headlineLarge,
            children: [
              TextSpan(text: ' M.R.P: ', style: titleMedium),
              TextSpan(text: mrp, style: titleMedium?.copyWith(decoration: TextDecoration.lineThrough)),
              const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.arrow_downward_rounded, color: Colors.green)),
              TextSpan(
                text: dis,
                style: titleLarge?.copyWith(color: Colors.green, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class MapToTableWidget extends StatelessWidget {
  final bool showBorder;
  final EdgeInsetsGeometry padding;
  final List<(String, String)> data;

  const MapToTableWidget({
    super.key,
    required this.data,
    this.showBorder = false,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: showBorder ? TableBorder.all() : null,
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: [
        for (var entry in data)
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: padding,
                  child: Text(
                    entry.$1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: padding,
                  child: Text(entry.$2),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
