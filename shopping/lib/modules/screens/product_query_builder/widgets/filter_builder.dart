import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/products_cubit/products_cubit.dart';
import 'package:shopping/modules/widgets/cards/item_card.dart';
import 'package:shopping/modules/widgets/product_cards/product_card.dart';

class ProductQueryFilterBuilder extends StatelessWidget {
  const ProductQueryFilterBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, BlocState<List<Product>>>(
      builder: (context, state) => state.on(
          onInitial: const Center(child: CircularProgressIndicator()),
          onFailure: (state) => Center(child: Text(state.message)),
          onSuccess: (state) => buildProductList(state.data)),
    );
  }

  Widget buildProductList(List<Product> data2) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: (data2.length / 2).round(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          i = i * 2;
          var j = i + 1;
          return Row(
            children: [
              if (i < data2.length)
                Expanded(child: RegularProductCard(type: ItemCardType.vertical, product: data2[i])),
              if (j < data2.length)
                Expanded(child: RegularProductCard(type: ItemCardType.vertical, product: data2[j]))
            ],
          );
        });
  }
}
