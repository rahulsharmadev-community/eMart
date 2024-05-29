// ignore_for_file: avoid_function_literals_in_foreach_calls

part of 'user_activity_repository.dart';

class UserActivityCache extends HiveCache<UserActivity> {
  final int cacheSize;
  UserActivityCache({this.cacheSize = 100}) : super(const UserActivity());

  void set(UserActivity activity) => state = activity;

  UserActivity? get() => state == const UserActivity() ? null : state;

  UserActivity addSuggestionKeywords(List<String> values) {
    int space = cacheSize - state.suggestionKeywords.length;
    List<String> list = [...state.suggestionKeywords, ...values];
    if (space <= 0) list = list.sublist(values.length);
    return state = state.copyWith(suggestionKeywords: list);
  }

  UserActivity addVisitedProduct(String value) {
    var list = [...state.visitedProducts];
    if (state.visitedProducts.length >= cacheSize) list.removeAt(0);
    return state = state.copyWith.visitedProducts(list..add(value));
  }

  @override
  fromJson(Map<String, dynamic> json) => UserActivity.fromJson(json);

  @override
  Map<String, dynamic> toJson(state) => state.toJson();
}
