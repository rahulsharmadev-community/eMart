import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shopping/core/blocs/products_cubit/products_cubit.dart';
import 'package:shopping/modules/screens/product_query_builder/widgets/filter_bar.dart';
import 'package:shopping/modules/screens/product_query_builder/widgets/filter_builder.dart';
import 'bloc/product_query_filter_cubit.dart';

class ProductQueryBuilder extends StatelessWidget {
  final Set<Query> initalQuery;
  final bool isImplicit;
  const ProductQueryBuilder(
    this.initalQuery, {
    super.key,
    this.isImplicit = false,
  });

  @override
  Widget build(BuildContext context) {
    var productsCubit = ProductsCubit();
    var controller = ProductQueryFilterCubit(productsCubit, inital: initalQuery);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: controller),
        BlocProvider.value(value: productsCubit),
      ],
      child: const Column(
        children: [
          ProductQueryFilterBar(),
          Expanded(child: ProductQueryFilterBuilder()),
        ],
      ),
    );
  }
}
