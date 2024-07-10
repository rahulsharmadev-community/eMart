import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/modules/screens/product_screen/bloc/product_cubit.dart';
import 'package:shopping/modules/screens/product_screen/mobile/widget/bottom_appbar.dart';
import 'package:shopping/modules/screens/product_screen/widgets/bottom_navigation_bar_builder.dart';
import 'package:shopping/modules/screens/product_screen/widgets/features_builder.dart';
import 'package:shopping/modules/screens/product_screen/widgets/multi_image_view.dart';
import 'package:shopping/modules/widgets/mobile_appbar.dart';
import 'widgets/customer_reviews_builder/customer_reviews_builder.dart';
part 'mobile/mobile_product_screen.dart';

class ProductScreen extends StatelessWidget {
  final String productId;
  const ProductScreen(this.productId, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          lazy: true,
          create: (context) => ProductCubit(productId: productId),
        ),
      ],
      child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        return state.on(
          onInitial: const CircularProgressIndicator(),
          onSuccess: (state) {
            var rating = state.data.rating.toRoundPrecision(1).toDouble();
            return _MobileProductScreen(
              product: state.data,
              children: [
                CustomerReviewsBuilder(
                  productId: productId,
                  rating: rating,
                  totalReviews: state.data.totalReviews.numberSimpleFormat,
                ).paddingHorizontal(12)
              ],
            );
          },
        );
      }),
    );
  }
}
