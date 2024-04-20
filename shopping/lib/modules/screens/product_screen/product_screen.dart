import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/modules/screens/product_screen/bloc/product_cubit.dart';
import 'package:shopping/modules/screens/product_screen/data.dart';
import 'package:shopping/modules/screens/product_screen/widgets/bottom_appbar_builder.dart';
import 'package:shopping/modules/screens/product_screen/widgets/bottom_navigation_bar_builder.dart';
import 'package:shopping/modules/screens/product_screen/widgets/features_builder.dart';
import 'package:shopping/modules/screens/product_screen/widgets/multi_image_view.dart';
import 'package:shopping/modules/widgets/mobile_appbar.dart';
import 'widgets/customer_reviews_builder/customer_reviews_builder.dart';
part 'mobile/mobile_product_screen.dart';

var testProduct = jsonDATA.map((e) => model.Product.fromJson(e)).toList();

class ProductScreen extends StatelessWidget {
  final String productId;
  const ProductScreen(this.productId, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          lazy: true,
          create: (context) => ProductCubit(
            productId: productId,
            repository: context.read<ProductRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ReviewsRepository(
            api: ReviewsApi(),
            cache: ReviewsCache(),
          ),
        )
      ],
      child: BlocBuilder<ProductCubit, BlocState>(builder: (context, state) {
        switch (state) {
          case BlocStateSuccess _:
            var product = state.data as model.Product;
            var numberFormat = const NumberFormat.en_in();
            var mrp = numberFormat.simple(product.mrp, currencySymbol: true, trimZero: true);
            var disPrice = numberFormat.simple(
              product.mrp - (product.mrp * product.discount * 0.01),
              currencySymbol: true,
              trimZero: true,
            );
            var rating = product.rating.toRoundPrecision(1).toDouble();

            return _MobileProductScreen(
              mrp: mrp,
              discountedPrice: disPrice,
              thumbnail: product.thumbnail,
              title: product.title,
              imageUrls: product.imageUrls,
              variants: testProduct
                  .sublist(8, 12)
                  .map((e) => Variant(title: e.productBrand ?? 'Products', thumbnail: e.thumbnail))
                  .toList(),
              detailedSpecs: product.detailedSpecs,
              discount: product.discount.toString(),
              rating: rating,
              feature: product.feature,
              productBrand: product.productBrand,
              shotDescription: product.shotDescription,
              totalReviews: product.totalReviews.numberCompactFormat,
              onBuy: () {},
              onCart: () {},
              children: [
                CustomerReviewsBuilder(
                  productId: productId,
                  rating: rating,
                  totalReviews: product.totalReviews.numberSimpleFormat,
                ).paddingHorizontal(12)
              ],
            );
          default:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
