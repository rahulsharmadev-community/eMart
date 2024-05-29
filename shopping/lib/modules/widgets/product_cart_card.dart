// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/widgets/add_to_cart_button.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/modules/widgets/cards/badge_icon.dart';
import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/utility/routes/app_routes.dart';
import 'package:jars/jars.dart';
import 'package:shopping/utility/size_after_render.dart';

class ProductCartCard extends StatelessWidget {
  final Product product;
  const ProductCartCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme;
    return InkWell(
      onTap: () => AppRoutes.ProductScreen.pushNamed(extra: product.productId),
      child: ItemCard(
        height: 160,
        leadingFactor: 0.3,
        ItemCardType.horizontal,
        surfaceTintColor: Colors.white,
        leading: CachedNetworkImage(imageUrl: product.thumbnail, fit: BoxFit.cover),
        badge: badgeIcon,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            title(context),
            8.gap,
            price(context),
            8.gap,
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  stockStatus(textTheme),
                  2.gap,
                  shopLabel(textTheme),
                  2.gap,
                  replacementRefundLabel(textTheme).fittedBox(),
                ],
              ).tightFit(),
              PlusMinusCounterWidget(productId: product.productId)
            ])
          ],
        ),
        labelPadding: null,
        labels: [CalculationTextWidget(product: product)],
      ),
    );
  }

  Widget stockStatus(textTheme) {
    return Text(
      '${product.status}',
      style: textTheme.labelSmall?.copyWith(color: Colors.green, fontWeight: FontWeight.normal),
    );
  }

  Widget shopLabel(textTheme) {
    return Text(
      product.shopId,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.normal),
    );
  }

  Widget replacementRefundLabel(textTheme) {
    String? temp;
    if (product.replacement != null &&
        product.refund != null &&
        product.replacement!.duration == product.refund!.duration) {
      temp = '${product.replacement!} Replace/Refund';
    } else if (product.replacement != null && !product.replacement!.isZero) {
      temp = '${product.replacement!} Replacement';
    } else {
      if (product.refund != null && !product.refund!.isZero) {
        temp = '${product.refund!} Refund';
      }
    }
    return temp != null
        ? Text(
            temp,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.normal),
          )
        : const SizedBox.shrink();
  }

  final numberFormat = const NumberFormat.en_in();

  Widget price(BuildContext context) {
    var discountedPrice = (product.mrp - (product.discount * product.mrp / 100)).toInt();
    var mrp = numberFormat.simple(product.mrp, currencySymbol: true, trimZero: true);
    var disp = numberFormat.simple(discountedPrice, currencySymbol: true, trimZero: true);
    return Text.rich(
      TextSpan(
        text: disp,
        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        children: [
          TextSpan(text: ' M.R.P: ', style: context.textTheme.bodySmall),
          TextSpan(
              text: mrp,
              style: context.textTheme.bodySmall?.copyWith(decoration: TextDecoration.lineThrough)),
          TextSpan(text: ' (${product.discount.toInt()}% OFF)', style: context.textTheme.bodySmall),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget title(BuildContext context) => Text(
        product.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  BadgeIcon get badgeIcon => BadgeIcon(text: '${product.discount.round()}%\nOFF');
}

class CalculationTextWidget extends StatelessWidget {
  final Product product;
  const CalculationTextWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    int count = context.select<PrimaryUserBloc, int>((bloc) {
      return bloc.primaryUser?.user.cartProducts[product.productId] ?? 0;
    });
    const format = NumberFormat.en_in();
    var discountedPrice = format.simple(
      product.discountedPrice,
      currencySymbol: true,
      trimZero: true,
      fractionDigits: 0,
    );
    var total = format.simple(product.discountedPrice * count,
        currencySymbol: true, trimZero: true, fractionDigits: 0);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      decoration: const BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Text(
        '$discountedPrice x $count = $total',
        style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.normal, color: Colors.white),
      ),
    );
  }
}

class PlusMinusCounterWidget extends StatelessWidget {
  final String productId;
  const PlusMinusCounterWidget({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    int count = context.select<PrimaryUserBloc, int>((bloc) {
      return bloc.primaryUser?.user.cartProducts[productId] ?? 0;
    });

    final read = context.read<PrimaryUserBloc>();
    void onDecrement() => read.add(PrimaryUserEvent.cartProductDecrement(productId));
    void onIncrement() => read.add(PrimaryUserEvent.cartProductIncrement(productId));
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        JButton(
                leadingIcon: Icons.remove_rounded,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(8),
                type: JButtonType.filled_tonal,
                onPressed: onDecrement)
            .squareBox(42),
        Text('$count').paddingHorizontal(16),
        JButton(
                leadingIcon: Icons.add,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(8),
                onPressed: onIncrement)
            .squareBox(42),
      ],
    );
  }
}
