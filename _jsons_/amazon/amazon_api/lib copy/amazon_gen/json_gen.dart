import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'amazon/amazon.dart';

const url = 'https://www.amazon.in/gp/product/B0BSNQ2KXF';

// https://m.media-amazon.com/images/I/31gdFybf5PL._SX569_.jpg
// https://m.media-amazon.com/images/I/31nEQU4zTTL._SX38_SY50_CR,0,0,38,50_.jpg
// https://m.media-amazon.com/images/I/61QdKeP+BtL._SX569_.jpg
Future<void> mainDownload() async {
  var amazon = Amazon();

  // var product = await amazon.productByUrl(url);

  var links = await amazon.getProductsLinksBySearch('Reebok Puma adidas Nike Shoes');

  List<Map<String, dynamic>> plist = [];
  try {
    await Future.wait(links.map((e) => amazon.productByUrl(e).then((value) => plist.add(value!.toJson()))));
  } catch (e) {
    print(e);
  }

  var file = File('data.json');
  await file.writeAsString(jsonEncode(plist));
}


