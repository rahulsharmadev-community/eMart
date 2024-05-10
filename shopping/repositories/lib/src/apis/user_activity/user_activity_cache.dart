// ignore_for_file: avoid_function_literals_in_foreach_calls

part of 'user_activity_repository.dart';

class UserActivityCache {
  final int cacheSize;
  UserActivityCache({this.cacheSize = 50});
  UserActivity _cache = const UserActivity();

  void set(UserActivity activity) => _cache = activity;

  UserActivity? get() => _cache == const UserActivity() ? null : _cache;

  UserActivity addSuggestionKeywords(List<String> values) {
    int space = cacheSize - _cache.suggestionKeywords.length;
    List<String> list = [..._cache.suggestionKeywords, ...values];
    print((space, list));
    if (space <= 0) list = list.sublist(values.length);

    return _cache = _cache.copyWith(suggestionKeywords: list);
  }

  UserActivity addVisitedProduct(String value) {
    var list = [..._cache.visitedProducts];
    if (_cache.visitedProducts.length >= cacheSize) list.removeAt(0);
    return _cache = _cache.copyWith.visitedProducts(list..add(value));
  }
}
