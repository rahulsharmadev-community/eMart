import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ico/ico.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/utility/extensions.dart';

class BottomAppBarBuilder extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final ValueNotifier<bool> isScrolOnTop;
  final Product product;

  const BottomAppBarBuilder({
    super.key,
    this.onTap,
    required this.isScrolOnTop,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var nf = const NumberFormat.en_in();
    var totalReviews = nf.simple(product.totalReviews);
    var rating = product.rating.toRoundPrecision(1).toDouble();
    var label = context.textTheme.labelMedium;

    var wish = context.primaryUser.user.findWishlist(product.productId);

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
                          imageUrl: product.thumbnail,
                          fit: BoxFit.cover,
                          width: kToolbarHeight,
                          height: kTextTabBarHeight,
                        ),
                      )),
              4.gap,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (product.productBrand != null)
                        Text("Brand: ${product.productBrand!}").fontWeight(FontWeight.w500),
                      const Spacer(),
                      Text('$rating ', style: label),
                      RatingBarIndicator(
                        rating: rating,
                        itemSize: 12,
                        itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
                      ),
                      Text(' $totalReviews', style: label?.copyWith(color: label.color?.withOpacity(.5))),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).tightFit(),
                      InkWell(
                          onTap: () => onTapBookmark(context),
                          child: Icon(wish == null ? Ico.book_mark_outline : Ico.bookmark_outline)),
                    ],
                  )
                ],
              ).tightFit()
            ],
          ),
        ),
      ),
    );
  }

  void onTapBookmark(BuildContext context) async {
    var bloc = context.read<PrimaryUserBloc>();
    var user = context.primaryUser.user;
    var wish = context.primaryUser.user.findWishlist(product.productId);
    var key = await showDialog<String?>(
        context: context,
        builder: (context) => SelectJDialog<String?>(
            title: product.title,
            tileJConfig: ListTileJConfig(
                items: user.wishlist.keys.map((e) => JListTile(key: e, title: Text(e))).toList()),
            onSelected: (e) => e,
            maxSelect: 1));

    bloc.add(PrimaryUserEvent.update((value) {
      return value.copyWith.wishlist({});
    }));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
