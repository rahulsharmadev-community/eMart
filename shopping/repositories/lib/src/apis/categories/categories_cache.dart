part of 'categories_repository.dart';

class CategoriesCache extends HiveCache<List<Category>> {
  CategoriesCache() : super([]);

  void set(List<Category> data) => state = data;

  List<Category> get(List<String> ids) {
    logs.i("AppMetaDataCache:get() initiating");
    var dateTime = DateTime.now();
    if (state.any((e) => e.expiry.isBefore(dateTime))) return [];
    return ids.map((a) => state.firstWhereOrNull((e) => e.id == a)).nonNulls().toList();
  }

  List<Category> getAll() {
    logs.i("AppMetaDataCache:getALL() initiating");
    logs.t(state);
    var dateTime = DateTime.now();
    if (state.any((e) => e.expiry.isBefore(dateTime))) return [];
    return state;
  }

  @override
  List<Category> fromJson(JSON json) => json.values.map((e) => Category.fromJson(JSON.from(e))).toList();

  @override
  JSON toJson(state) => {
        for (var e in state) ...{e.id: e.toJson()}
      };
}
