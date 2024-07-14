part of 'categories_repository.dart';

class CategoriesCache extends HiveCache<JSON> {
  CategoriesCache() : super({});

  /// Returns the expiry date of the cache
  DateTime get expiry => DateTime.parse(state.keys.first);

  JSON? get() {
    if (state.isEmpty) return null; // no cache

    // cache expired
    if (expiry.isBefore(DateTime.now())) {
      state.clear();
      return null;
    }

    return state.values.first; // return the cache
  }

  void set(JSON state) {
    var expiryDateTime = DateTime.now().add(48.hours).toIso8601String();
    this.state = {expiryDateTime: state}; // set the cache
  }

  @override
  JSON fromJson(Map<String, dynamic> json) => json;

  @override
  Map<String, dynamic> toJson(JSON state) => state;
}
