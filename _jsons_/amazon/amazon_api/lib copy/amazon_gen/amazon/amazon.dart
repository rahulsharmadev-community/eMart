import 'dart:convert' as convert;
import 'dart:io';
import 'dart:math';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:shared/models.dart';

part 'operations.dart';

class Amazon with _AmazonOperations {
  Future<List<String>> getProductsLinksBySearch(String text) async {
    Set<String> links = {};
    int page = 1;
    List<String> temp = [];
    while (page < 2) {
      var doc = await _convertToDoc('https://www.amazon.in/s?k=$text&page=$page');
      if (doc == null) break;
      temp = _getLinksBySearch(doc);
      if (temp.isEmpty) return links.toList();
      links.addAll(temp);
      page++;
      print(links.length);
    }
    return links.toList();
  }

  Future<Product?> productByUrl(String url) async {
    var doc = await _convertToDoc(url);
    if (doc == null) return null;

    var random = Random();
    var basic = _getBasic(doc);
    var year = basic['WARRANTY']?.replaceAll(RegExp(r'[^0-9]'), '');
    var rp = basic['RETURNS_POLICY'] == null ? null : DurationPeriod.day(7);
    var pd = _getPriceDiscount(doc);
    var images = _getImages(doc);
    var detailedSpecs = _getDetailedSpecs(doc);
    var features = _getFeature(doc);

    String title;
    if (features?['Brand'] != null && features?['Model Name'] != null) {
      title = "${features!['Brand']} ${features['Model Name']}";
    } else {
      title = _getTitle(doc) ?? 'Unknow';
    }
    return Product(
      shopId: 'fb05d6b8-a0e3-54ea-8293-723be8663fe2',
      title: title,
      mrp: pd.mrp,
      discount: pd.discount,
      productBrand: detailedSpecs?['Brand'],
      feature:
          features == null ? null : [for (var e in features.entries) "${e.key.trim()}: ${e.value.trim()}"],
      shotDescription: _getDescription(doc)?.join('\n'),
      detailedSpecs: detailedSpecs ?? {},
      thumbnail: images?.first ?? 'https://placehold.co/600x400.png',
      imageUrls: images?.sublist(1) ?? [],
      warrantyPeriod: year == null ? null : DurationPeriod.year(int.parse(year)),
      refund: rp,
      replacement: rp,
      unit: ProductUnit(quantity: 1),
      rating: random.nextDouble() * 5,
      totalReviews: random.nextInt(pow(10, 5).toInt()),
      deliveryMetaData: {State.INDL: DeliveryMetaData(deliveryEstimation: DeliveryEstimation.oneToTwo)},
    );
  }
}
