import 'dart:convert';
import 'package:repositories/src/utils/http_request.dart';
import 'package:shared/models.dart';
import '../utils/error_handler.dart';

class KeywordRepository with CustomExceptionHandler {
  final HttpService _db;
  KeywordRepository({String? auth})
      : _db = HttpService(
            'https://getproductsearch-default-rtdb.asia-southeast1.firebasedatabase.app/PRODUCT-KEYWORDS/.json',
            auth: auth);

  Future<JSON<String>?> searchProduct(String word) async {
    word = word.trim().toLowerCase();
    if (word.isEmpty) return null;
    var response = await _db.get(orderBy: '\$key', startAt: word, endAt: "$word\uf8ff");
    return (json.decode(response!.body) as Map).map((key, value) => MapEntry(key, value.toString()));
  }
}
