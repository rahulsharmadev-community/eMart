import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/screens/product_query_screen/bloc/product_query_bloc.dart';

class ProductQueryScreen extends StatelessWidget {
  final List<Query> initalQuery;
  const ProductQueryScreen(this.initalQuery, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductQueryBloc(
        context.read<ProductRepository>(),
      )..add(ProductQueryInitiateEvent(initalQuery)),
    );
  }
}
