import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart' as model;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping/modules/screens/product_screen/data.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/modules/widgets/mobile_appbar.dart';
part 'mobile/mobile_product_screen.dart';

var testProduct = jsonDATA.map((e) => model.Product.fromJson(e)).toList();

class ProductScreen extends StatefulWidget {
  final String productId;
  const ProductScreen(this.productId, {super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var product = testProduct.last;
    var numberFormat = const NumberFormat.en_in();

    var mrp = numberFormat.simple(product.mrp, currencySymbol: true, trimZero: true);

    var disPrice = numberFormat.simple(
      product.mrp - (product.mrp * product.discount * 0.01),
      currencySymbol: true,
      trimZero: true,
    );
    return context.buildFor(
        android: _MobileProductScreen(
            mrp: mrp,
            discountedPrice: disPrice,
            thumbnail: product.thumbnail,
            title: product.title,
            imageUrls: product.imageUrls,
            variants: testProduct
                .sublist(8, 12)
                .map((e) => Variant(title: e.productBrand??'Products', thumbnail: e.thumbnail))
                .toList(),
            detailedSpecs: product.detailedSpecs,
            discount: product.discount.toString(),
            rating: product.rating.toRoundPrecision(1).toDouble(),
            feature: product.feature,
            productBrand: product.productBrand,
            shotDescription: product.shotDescription,
            totalReviews: product.totalReviews.numberCompactFormat));
  }
}
