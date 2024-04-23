import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';

class AddToCartButton extends StatelessWidget {
  final String productId;
  final String title;
  final JButtonType? type;
  final BorderRadius? borderRadius;
  const AddToCartButton({
    super.key,
    this.type,
    this.borderRadius,
    required this.productId,
    this.title = 'Add to Cart',
  });

  void onPressed(BuildContext context) {
    var read = context.read<PrimaryUserBloc>();
    read.add(PrimaryUserEvent.cartProductIncrement(productId));
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.select<PrimaryUserBloc, Map<String, int>>((bloc) => bloc.primaryUser!.cartProducts);
    var count = cart[productId] ?? 0;
    return JButton(
      text: title,
      badge: count != 0 ? Badge.count(count: count) : null,
      leadingIcon: Icons.add,
      padding: EdgeInsets.zero,
      type: type ?? JButtonType.filled,
      borderRadius: borderRadius ?? BorderRadius.circular(100),
      onPressed: () => onPressed(context),
    );
  }
}
