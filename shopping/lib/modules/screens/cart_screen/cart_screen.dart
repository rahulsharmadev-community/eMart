import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/widgets/product_cart_card.dart';
import 'cubits/cart_cubit.dart';
import '../../widgets/delivery_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<PrimaryUserBloc>();
    var productIds = bloc.primaryUser?.user.cartProducts.keys.toList() ?? [];
    return BlocProvider(
      create: (context) => CartCubit(context.read<ProductRepository>())..fetch(productIds),
      child: ListView(
        children: [
          const DeliveryTile(),
          BlocBuilder<CartCubit, BlocState>(
            builder: (context, state) {
              return switch (state) {
                BlocStateInitial _ => const Center(child: CircularProgressIndicator()),
                BlocStateLoading _ => const Center(child: CircularProgressIndicator()),
                BlocStateFailure _ => Center(child: Text(state.message)),
                BlocStateSuccess _ => (state.data as List).isEmpty
                    ? const Center(child: Text('Empty'))
                    : buildProductCarts(state, bloc)
              };
            },
          ),
        ],
      ),
    );
  }

  ListView buildProductCarts(BlocStateSuccess<dynamic> state, PrimaryUserBloc bloc) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: state.data.length,
      itemBuilder: (context, i) {
        var product = (state.data as List<Product>)[i];
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
            onDismissed: (direction) => bloc.add(PrimaryUserEvent.cartProductRemove(product.productId)),
            child: ProductCartCard(product: product));
      },
      // separatorBuilder: (context, index) => const Gap(2),
    );
  }
}
