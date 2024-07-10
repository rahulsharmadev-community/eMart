// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/widgets/add_to_cart_button.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/modules/widgets/cards/badge_icon.dart';
import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/utility/routes/routes_initialise.dart';
import 'package:jars/jars.dart';

class RegularProductCard extends StatelessWidget {
  final ItemCardType type;
  final bool hideActions;

  final Product product;
  const RegularProductCard({
    super.key,
    required this.type,
    required this.product,
    this.hideActions = false,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    double height = type == ItemCardType.vertical ? 290 : 200;

    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.ProductRoute.name, extra: product.productId);
        context.read<PrimaryUserBloc>().add(AddVisitedProductEvent(product.productId));
      },
      child: ItemCard(
        key: globalKey,
        type,
        height: height,
        surfaceTintColor: Colors.white,
        leading: CachedNetworkImage(imageUrl: product.thumbnail, fit: BoxFit.cover),
        badge: badgeIcon,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            title(context),
            4.gap,
            rating(context),
            4.gap,
            price(context, globalKey),
            4.gap,
            deliveryText(context),
          ],
        ),
        labels: [const Text('◈ Sponsored').fontSize(300).fittedBox()],
        actionsPadding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
        actions: hideActions
            ? null
            : [
                AddToCartButton(
                  productId: product.productId,
                  title: 'Cart',
                  type: JButtonType.filled_tonal,
                ).tightFit(),
                const SizedBox(width: 6),
                JButton(
                  text: 'Buy',
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(100),
                  type: JButtonType.filled,
                ).tightFit(),
              ],
      ),
    );
  }

  final numberFormat = const NumberFormat.en_in();

  Widget price(BuildContext context, GlobalKey globalKey) {
    var discountedPrice = (product.mrp - (product.discount * product.mrp / 100)).toInt();
    var mrp = numberFormat.simple(product.mrp, currencySymbol: true, trimZero: true);
    var disp = numberFormat.simple(discountedPrice, currencySymbol: true, trimZero: true);
    return Text.rich(
      TextSpan(
        text: disp,
        style: context.textTheme.bodyLarge,
        children: [
          TextSpan(text: 'M.R.P: ', style: context.textTheme.bodySmall),
          TextSpan(
              text: mrp,
              style: context.textTheme.bodySmall?.copyWith(decoration: TextDecoration.lineThrough)),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget rating(BuildContext context) {
    var ratingBar = RatingBarIndicator(
      rating: product.rating,
      itemSize: 18,
      itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
    );
    return SizedBox(
      height: 14,
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(product.rating.toString()).fontWeight(FontWeight.w500).paddingOnly(right: 2),
            ratingBar,
            Text('(${product.totalReviews.numberCompactFormat})').paddingOnly(left: 2),
          ],
        ),
      ),
    );
  }

  Widget deliveryText(BuildContext context) {
    String str1;
    String str2;
    var data = product.deliveryMetaData.entries.first.value;
    var dEst = data.deliveryEstimation;
    str1 = data.deliveryCost == 0 && data.shippingCost == 0 ? 'FREE delivery ' : 'Delivery ';
    if (dEst.maxDay <= 2) {
      str2 = 'Tomorrow ';
    } else {
      var format = DateTime.now().add(dEst.maxDay.days).format();
      str2 = dEst.maxDay <= 7 ? format.weekday() : format.yMMMd().split(',').first;
    }
    return Text.rich(
        TextSpan(text: str1, children: [
          TextSpan(
            text: str2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
        style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.normal));
  }

  Widget title(BuildContext context) => Text(
        product.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  BadgeIcon get badgeIcon => BadgeIcon(text: '${product.discount.round()}%\nOFF');
}
