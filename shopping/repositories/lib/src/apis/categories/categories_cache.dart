part of 'categories_repository.dart';

class CategoriesCache extends HiveCache<List<Category>> {
  CategoriesCache();

  void set(List<Category> data) {
    logs.i("AppMetaDataCache:data() initiating");

    final temp = [...getByKey('state') ?? []];
    putByKey('state', temp..addAll(data));
  }

  List<Category> get(List<String> ids) {
    logs.i("AppMetaDataCache:get() initiating");

    final temp = [...getByKey('state') ?? []];
    var dateTime = DateTime.now();
    temp.removeWhere((e) => e.expiry.isBefore(dateTime));
    putByKey('state', temp.map((e) => e).toList());

    return ids.map((a) => temp.firstWhereOrNull((e) => e.id == a)).nonNulls().toList();
  }

  List<Category> getAll() {
    logs.i("AppMetaDataCache:get() initiating");

    final temp = ;
    var dateTime = DateTime.now();
    temp.removeWhere((e) => e.expiry.isBefore(dateTime));
    putByKey('state', temp);
    return temp;
  }

  @override
  fromJson(JSON json) => [for (var e in json.entries) Category.fromJson(e.value)];

  @override
  JSON toJson(state) => {for (var e in state) e.id: e.toJson()};
}
