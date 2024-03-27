part of 'keywords_repository.dart';

class KeywordsCache extends HydratedCubit<Keywords> {
  KeywordsCache() : super([]);

  Keywords get(String word) {
    logs.i("KeywordsCache:get($word) initiating");
    return state
        .where((e) => e.label.removeAllSpace.toLowerCase().startsWith(word.removeAllSpace.toLowerCase()))
        .toList();
  }

  void add(Keywords latest) {
    logs.i("KeywordsCache:add($latest) initiating");
    var temp = state..addAll(latest);
    emit(temp);
  }

  void remove(String word) {
    var temp = state..removeWhere((e) => e.label == word);
    emit(temp);
  }

  void clearAll() => emit([]);

  @override
  fromJson(JSON json) => List.from(json['state']).map((e) => Keyword.fromJson(e)).toList();
  @override
  JSON? toJson(state) => {'state': state.map((e) => e.toJson()).toList()};
}
