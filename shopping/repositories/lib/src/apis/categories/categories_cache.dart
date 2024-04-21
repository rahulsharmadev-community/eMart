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
    logs.i("AppMetaDataCache:get() initiating");
    var dateTime = DateTime.now();
    if (state.any((e) => e.expiry.isBefore(dateTime))) return [];
    return state;
  }

  @override
  List<Category> fromJson(JSON json) => List.from(json['state']).map((e) => Category.fromJson(e)).toList();

  @override
  JSON toJson(state) => {'state': state.map((e) => e.toJson()).toList()};
}
