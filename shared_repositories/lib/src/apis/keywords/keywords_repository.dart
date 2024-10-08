import 'dart:convert';
import 'package:jars/jars_core.dart';
import '/src/utils/error_handler.dart';
import 'package:hive_cache/hive_cache.dart';
import '/src/utils/http_request.dart';
import 'package:shared/apis.dart';
import 'package:shared/models.dart';
part 'keyword_api.dart';
part 'keywords_cache.dart';

class KeywordsRepository {
  final KeywordsCache cache = KeywordsCache();
  final KeywordsApi api = KeywordsApi();

  Future<Keywords> searchWord(String word) async {
    var result = cache.get(word);
    if (result.isNotEmpty) return result;

    result = await api.search(word);
    logs.i(result);
    cache.add(result);
    return result;
  }
}
