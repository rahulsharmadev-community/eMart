part of 'keywords_repository.dart';

class KeywordsCache extends HiveCache<Keywords> {
  KeywordsCache() : super([]);

  Keywords get(String word) {
    logs.i("KeywordsCache:get($word) initiating");
    bool test(e) => e.label.removeAllSpace.toLowerCase().startsWith(word.removeAllSpace.toLowerCase());
    return state.where(test).toList();
  }

  void add(Keywords latest) {
    logs.i("KeywordsCache:add($latest) initiating");
    state.addAll(latest);
  }

  void remove(String word) => state.removeWhere((e) => e.label == word);

  void clearAll() => state.clear();

  @override
  fromJson(JSON json) => List.from(json['state']).map((e) => Keyword.fromJson(e)).toList();
  @override
  JSON toJson(state) => {'state': state.map((e) => e.toJson()).toList()};
}
