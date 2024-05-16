import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/modules/widgets/product_cart_card.dart';
import 'cubits/cart_cubit.dart';
import 'delivery_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        context.read<ProductRepository>(),
        context.read<PrimaryUserBloc>(),
      ),
      lazy: false,
      child: BlocBuilder<CartCubit, BlocState>(builder: (context, state) {
        return switch (state) {
          BlocStateInitial _ => const Center(child: CircularProgressIndicator()),
          BlocStateLoading _ => const Center(child: CircularProgressIndicator()),
          BlocStateFailure _ => Center(child: Text(state.message)),
          BlocStateSuccess _ => buildContext((state as BlocStateSuccess<Cart>).data)
        };
      }),
    );
  }

  RenderObjectWidget buildContext(Cart cart) {
    return cart.list.isEmpty
        ? const Center(child: Text('Empty'))
        : Column(children: [buildProductCarts(cart).tightFit(), BottomPlaceOrderBar(cart)]);
  }

  ListView buildProductCarts(
    Cart cart,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: cart.list.length,
      itemBuilder: (context, i) {
        return Dismissible(
            key: Key('$i'),
            direction: DismissDirection.endToStart,
            background: Material(
              color: context.theme.colorScheme.errorContainer,
              textStyle: TextStyle(color: Colors.red.shade700),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Delete'),
                  Icon(
                    Icons.delete_sweep,
                    color: Colors.red.shade700,
                  ).paddingHorizontal(16)
                ],
              ),
            ),
            onDismissed: (direction) {
              context
                  .read<PrimaryUserBloc>()
                  .add(PrimaryUserEvent.cartProductRemove(cart.list[i].product.productId));
            },
            child: ProductCartCard(product: cart.list[i].product));
      },
      // separatorBuilder: (context, index) => const Gap(2),
    );
  }
}

class BottomPlaceOrderBar extends StatelessWidget {
  final Cart cart;
  const BottomPlaceOrderBar(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    const nf = NumberFormat.en_in();
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(offset: Offset(0, -4), blurRadius: 10, color: Colors.black12)],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Column(
        children: [
          const DeliveryTile(),
          const Divider(height: 0, indent: 10, endIndent: 10),
          8.gap,
          Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '${nf.simple(cart.amount, currencySymbol: true, trimZero: true)}\nTotal Price',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleSmall,
                  ),
                  12.gap,
                  JButton(
                    text: 'Place order',
                    borderRadius: BorderRadius.circular(8),
                    onPressed: () {},
                  ).tightFit(),
                ],
              )),
          8.gap,
        ],
      ),
    );
  }
}
