import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jars/jars.dart';

class BottomAppBarBuilder extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;
  final ValueNotifier<bool> isScrolOnTop;
  final String? productBrand;
  final double rating;
  final String totalReviews;
  const BottomAppBarBuilder({
    super.key,
    this.onTap,
    required this.isScrolOnTop,
    required this.image,
    required this.title,
    this.productBrand,
    required this.rating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    Widget brandAndRating() {
      var ratingBar = RatingBarIndicator(
        rating: rating,
        itemSize: 12,
        itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
      );
      var label = context.textTheme.labelMedium;
      return Row(
        children: [
          if (productBrand != null) Text("Brand: ${productBrand!}").fontWeight(FontWeight.w500),
          const Spacer(),
          Text('$rating ', style: label),
          ratingBar,
          Text(' $totalReviews', style: label?.copyWith(color: label.color?.withOpacity(.5))),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
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
                          imageUrl: image,
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
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ).tightFit()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
