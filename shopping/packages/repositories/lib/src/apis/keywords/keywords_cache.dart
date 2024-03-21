import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:repositories/repositories.dart' show Keywords;

class KeywordsCache extends HydratedCubit<Keywords> {
  KeywordsCache() : super({});

  Keywords? get(String word) {
    Keywords temp = {};
    for (var map in state.entries) {
      if (map.key.startsWith(word)) {
        temp = {
          map.key: map.value,
          ...temp,
        };
      }
    }
    return temp.isEmpty ? null : temp;
  }

  void add(Keywords latest) => state.addAll(latest);

  bool contains(String key) => state.containsKey(key);

  void remove(String key) => state.remove(key);

  void clearAll() => state.clear();

  @override
  fromJson(Map<String, dynamic> json) => json.map((key, value) => MapEntry(key, value));

  @override
  Map<String, dynamic>? toJson(state) => state;
}
