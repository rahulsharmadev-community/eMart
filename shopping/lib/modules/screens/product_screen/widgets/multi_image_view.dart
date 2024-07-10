import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MultiImageViewBuilder extends StatefulWidget {
  final List<String> imageUrls;
  const MultiImageViewBuilder(
    this.imageUrls, {
    super.key,
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
              aspectRatio: 4 / 5,
              child: PageView.builder(
                itemCount: widget.imageUrls.length,
                controller: controller,
                itemBuilder: (context, i) => CachedNetworkImage(
                  width: context.width,
                  imageUrl: widget.imageUrls[i],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: SmoothPageIndicator(
                controller: controller,
                count: widget.imageUrls.length,
                effect: WormEffect(
                  activeDotColor: context.theme.primaryColor,
                  dotColor: context.theme.disabledColor,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
                onDotClicked: (index) => controller.jumpToPage(index),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
