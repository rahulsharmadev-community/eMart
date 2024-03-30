part of 'categories_repository.dart';

class CategoriesCache extends HydratedCubit<List<Category>> {
  CategoriesCache() : super(const []);

  void set(List<Category> data) => emit(data);

  List<Category>? get(List<String> ids) {
    logs.i("AppMetaDataCache:get() initiating");
    var dateTime = DateTime.now();
    if (state.any((e) => e.expiry.isBefore(dateTime))) return null;
    return ids.map((a) => state.firstWhere((e) => e.id == a)).toList();
  }

  List<Category>? getAll() {
    logs.i("AppMetaDataCache:get() initiating");
    var dateTime = DateTime.now();
    if (state.any((e) => e.expiry.isBefore(dateTime))) return null;
    return state;
  }

  @override
  fromJson(Map<String, dynamic> json) => List.from(json['state']).map((e) => Category.fromJson(e)).toList();

  @override
  Map<String, dynamic>? toJson(state) => {'state': state.map((e) => e.toJson()).toList()};
}
