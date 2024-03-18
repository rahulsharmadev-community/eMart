import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:jars/extensions.dart";
import "package:shared/models.dart";
import "package:shopping/blocs/cached/cached_limit.dart";

typedef Keyword = Map<String, ({String thumbnail, DateTime lastSearchedAt})>;

class KeywordsCached extends HydratedCubit<Keyword> {
  KeywordsCached() : super(const {}) {
    _removeOldKeywords();
  }

  JSON<String> searchWord(String word) {
    JSON<String> temp = {};
    for (var map in state.entries) {
      if (map.key.startsWith(word)) {
        temp = {
          map.key: map.value.thumbnail,
          ...temp,
        };
      }
    }
    return temp;
  }

  void add(JSON<String> list) {
    if (list.isEmpty || _checkOverFlow) return;
    final now = DateTime.now();
    final temp = {...state};
    for (var e in list.entries) {
      temp[e.key] = (thumbnail: e.value, lastSearchedAt: now);
    }
    emit(temp);
  }

  void _removeOldKeywords() {
    if (state.isEmpty) return;
    final temp = {...state};
    final threshold = DateTime.now().subtract(120.days);
    temp.removeWhere((k, v) => v.lastSearchedAt < threshold);
    emit(temp);
  }

  bool get _checkOverFlow => state.length >= keywordsCachedLimit;

  @override
  Keyword? fromJson(Map<String, dynamic> json) {
    return json.map((key, value) {
      return MapEntry(key, (thumbnail: value, lastSearchedAt: value));
    });
  }

  @override
  Map<String, dynamic>? toJson(Keyword state) {
    return state.map((key, value) {
      return MapEntry(key, {
        'thumbnail': value.thumbnail,
        'lastSearchedAt': value.lastSearchedAt.millisecondsSinceEpoch,
      });
    });
  }
}
