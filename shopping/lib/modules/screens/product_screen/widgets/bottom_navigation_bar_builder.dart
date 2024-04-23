import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shopping/modules/widgets/add_to_cart_button.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';

class BottomNavigationBarBuilder extends StatelessWidget {
  final String productId;
  final VoidCallback? onCart;
  final VoidCallback? onBuy;
  const BottomNavigationBarBuilder({
    super.key,
    this.onCart,
    this.onBuy,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(64),
      child: Row(
        children: [
          if (onCart != null)
            AddToCartButton(
              title: 'Add to Cart',
              borderRadius: BorderRadius.zero,
              type: JButtonType.filled_tonal,
              productId: productId,
            ).tightFit(),
          if (onBuy != null)
            JButton(
              text: 'Buy Now',
              onPressed: onBuy,
            ).tightFit(),
        ],
      ),
    );
  }
}
