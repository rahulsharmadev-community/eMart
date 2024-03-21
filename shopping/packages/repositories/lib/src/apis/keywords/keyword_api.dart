import 'dart:convert';
import 'package:jars/extensions.dart';
import 'package:repositories/repositories.dart' show Keywords;
import 'package:repositories/src/utils/http_request.dart';
import 'package:shared/credentials.dart';

class KeywordsApi {
  Future<Keywords> search(String word) async {
    word = word.removeAllSpace.toLowerCase();
    if (word.isEmpty) return {};

    final skdb = SKDB.get(word);
    final http = HttpService('${skdb.ref}/PRODUCT-KEYWORDS/.json', auth: skdb.token);
    var response = await http.get(orderBy: '\$key', startAt: word, endAt: "$word\uf8ff", limitToFirst: 10);
    var now = DateTime.now();
    return (json.decode(response!.body) as Map).map((key, value) {
      return MapEntry(key, (thumbnail: value.toString(), lastSearchedAt: now));
    });
  }

  Future<void> set(String word, String thumbnail) async {
    word = word.removeAllSpace.toLowerCase();
    if (word.isEmpty || !Uri.parse(thumbnail).isAbsolute) return;

    final skdb = SKDB.get(word);
    final http = HttpService('${skdb.ref}/PRODUCT-KEYWORDS/.json', auth: skdb.token);
    await http.patch({word: thumbnail});
  }
}
