import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shopping/modules/screens/product_screen/product_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MultiImageViewBuilder extends StatefulWidget {
  final List<String> imageUrls;
  final List<Variant> variants;
  const MultiImageViewBuilder({
    super.key,
    required this.imageUrls,
    required this.variants,
  });

  @override
  State<MultiImageViewBuilder> createState() => _MultiImageViewBuilderState();
}

class _MultiImageViewBuilderState extends State<MultiImageViewBuilder> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: PageView.builder(
                itemCount: widget.imageUrls.length,
                controller: controller,
                itemBuilder: (context, i) => CachedNetworkImage(
                  width: context.screenSize.width,
                  imageUrl: widget.imageUrls[i],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: SmoothPageIndicator(
                controller: controller,
                count: widget.imageUrls.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
                onDotClicked: (index) => controller.jumpToPage(index),
              ),
            ),
          ],
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
}
