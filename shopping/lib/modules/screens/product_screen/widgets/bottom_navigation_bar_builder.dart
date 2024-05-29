import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shopping/modules/screens/payment_screen/payment_screen.dart';
import 'package:shopping/modules/widgets/add_to_cart_button.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';

class ActionButtonsBuilder extends StatelessWidget {
  final Product product;
  final bool hideBuyButton;
  final bool hideAddToButton;
  const ActionButtonsBuilder({
    super.key,
    required this.product,
    this.hideBuyButton = false,
    this.hideAddToButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(64),
      child: Row(
        children: [
          if (!hideAddToButton)
            AddToCartButton(
              title: 'Add to Cart',
              borderRadius: BorderRadius.zero,
              type: JButtonType.filled_tonal,
              productId: product.productId,
            ).tightFit(),
          if (!hideBuyButton)
            JButton(
              text: 'Buy Now',
              onPressed: () => showPaymentBottomSheet(context, {product.productId: 1}),
            ).tightFit(),
        ],
      ),
    );
  }
}
