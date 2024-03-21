import "package:repositories/src/apis/keywords/keyword_api.dart";
import "package:repositories/src/apis/keywords/keywords_cache.dart";

typedef Keywords = Map<String, ({String thumbnail, DateTime lastSearchedAt})>;

class KeywordsRepository {
  final KeywordsCache cache;
  final KeywordsApi api;
  KeywordsRepository({required this.api, required this.cache});

  Future<Keywords> searchWord(String word) async {
    final cachedResult = cache.get(word);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await api.search(word);
    cache.add(result);
    return result;
  }
}
