// ignore_for_file: unused_element

part of 'amazon.dart';

mixin _AmazonOperations {
  static Duration waiting = Duration.zero;
  Future<Document?> _convertToDoc(String url) async {
    await Future.delayed(waiting, () => waiting = Duration(seconds: 3));
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 503) throw HttpException('503 - Service Unavailable Error');
      return parser.parse(response.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  List<String> _getLinksBySearch(Document document) {
    var temp = document.getElementsByClassName('s-search-results').first;
    List<String> result = [];
    temp.querySelectorAll('div[data-asin]').forEach((e) {
      if (e.attributes['data-asin'] != null && e.attributes['data-asin']!.isNotEmpty) {
        result.add('https://www.amazon.in/gp/product/${e.attributes['data-asin']}');
      }
    });
    print(result);
    return result;
  }

  /// {  RETURNS_POLICY: 7 days Service Centre Replacement, FREE_DELIVERY: Free Delivery, WARRANTY: 1 Year Warranty, TOP_BRAND: Top Brand, SERVICE: Installation available, AMAZON_DELIVERED: Amazon Delivered}
  Map<String?, String?> _getBasic(Document document) {
    var temp = document.getElementsByClassName('a-carousel-card tw-scroll-carousel-element');
    var map = temp.map((e) {
      var item = e.querySelector('div[data-name]');
      return {item!.id: item.text.trim()};
    }).reduce((value, element) => {...value, ...element});

    return map;
  }

  List<String>? _getDescription(Document document) {
    var list = document.getElementsByClassName('a-unordered-list a-vertical a-spacing-mini');
    var ret = list.map((e) => e.text.trim()).toList();
    return ret.isEmpty ? null : ret;
  }

  Map<String, String>? _getDetailedSpecs(Document document) {
    var price = document.getElementById('prodDetails');
    var text = price?.querySelectorAll('tr');
    Map<String, String> map = {};
    text?.forEach((e) {
      if (e.children.length == 2 && e.children[1].text.trim().length < 250)
        map.addAll({e.children[0].text.trim(): e.children[1].text.trim()});
    });
    return map;
  }

  Map<String, String>? _getFeature(Document document) {
    var price = document.getElementsByClassName('a-normal a-spacing-micro').first;
    var text = price.querySelectorAll('tr');
    Map<String, String> map = {};
    text.forEach((e) {
      if (e.children.length == 2) map.addAll({e.children[0].text.trim(): e.children[1].text.trim()});
    });
    return map;
  }

  ({double mrp, double discount}) _getPriceDiscount(Document document) {
    var price = document.getElementById('corePriceDisplay_desktop_feature_div');
    var discount = price
            ?.getElementsByClassName(
                'a-size-large a-color-price savingPriceOverride aok-align-center reinventPriceSavingsPercentageMargin savingsPercentage')
            .first
            .text
            .replaceAll(RegExp(r'[^0-9]'), '') ??
        '0';
    var mrp = price
            ?.getElementsByClassName('a-price a-text-price')[0]
            .children[0]
            .text
            .replaceAll(RegExp(r'[^0-9]'), '') ??
        '0';

    var fdiscount = double.parse(discount);
    var fmrp = double.parse(mrp);

    return (mrp: fmrp, discount: fdiscount);
  }

  String? _getTitle(Document document) {
    var title = document.getElementById('productTitle');
    return title?.text.trim();
  }

  List<String>? _getImages(Document doc) {
    var javascriptElements = doc.querySelectorAll('script[type="text/javascript"]');
    var element = javascriptElements.firstWhere((element) => element.text.contains('ImageBlockATF'));
    // ignore: unrelated_type_equality_checks
    if (element == -1) return null;

    var jsonString = element.text.substring(
        element.text.indexOf("'colorImages': { 'initial': ") + 28, element.text.indexOf('}]}') + 2);

    var jsonDecode = (convert.jsonDecode(jsonString) as List).map((e) => e['large']);

    return jsonDecode.map((e) => e.toString()).toList();
  }
}
