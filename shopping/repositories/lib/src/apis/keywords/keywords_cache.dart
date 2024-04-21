part of 'keywords_repository.dart';

///
class KeywordsCache extends HiveCache<Keywords> {
  KeywordsCache();

  Keywords get(String word) {
    logs.i("KeywordsCache:get($word) initiating");
    var byKey = getByKey('state') ?? [];
    return byKey
        .where((e) => e.label.removeAllSpace.toLowerCase().startsWith(word.removeAllSpace.toLowerCase()))
        .toList();
  }

  void add(Keywords latest) {
    logs.i("KeywordsCache:add($latest) initiating");
    var temp = [...(getByKey('state') ?? [])];
    putByKey('state', temp..addAll(latest));
  }

  void remove(Keyword word) {
    logs.i("KeywordsCache:remove($word) initiating");
    var temp = [...(getByKey('state') ?? [])];
    putByKey('state', temp..remove(word));
  }

  @override
  Keywords fromJson(JSON json) {
    return List.from(json['state']).map((e) => Keyword.fromJson(e)).toList();
  }

  @override
  JSON toJson(Keywords state) {
    return {'state': state.map((e) => e.toJson()).toList()};
  }
}
