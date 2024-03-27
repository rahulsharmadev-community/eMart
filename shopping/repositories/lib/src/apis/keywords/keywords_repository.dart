import 'dart:convert';
import 'package:jars/extensions.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:repositories/src/utils/http_request.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'keyword_api.dart';
part 'keywords_cache.dart';

class KeywordsRepository {
  final KeywordsCache cache;
  final KeywordsApi api;
  KeywordsRepository({required this.api, required this.cache});

  Future<Keywords> searchWord(String word) async {
    var result = cache.get(word);
    if (result.isNotEmpty) return result;

    result = await api.search(word);
    logs.i(result);
    cache.add(result);
    return result;
  }
}
