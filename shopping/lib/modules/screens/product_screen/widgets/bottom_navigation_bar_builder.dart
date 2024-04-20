import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';

class BottomNavigationBarBuilder extends StatelessWidget {
  final VoidCallback? onCart;
  final VoidCallback? onBuy;
  const BottomNavigationBarBuilder({
    super.key,
    this.onCart,
    this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(64),
      child: Row(
        children: [
          if (onCart != null)
            DefaultButton(
              'Add to Cart',
              filledTone: true,
              onPressed: onCart,
            ).tightFit(),
          if (onBuy != null)
            DefaultButton(
              'Buy Now',
              onPressed: onBuy,
            ).tightFit(),
        ],
      ),
    );
  }
}
