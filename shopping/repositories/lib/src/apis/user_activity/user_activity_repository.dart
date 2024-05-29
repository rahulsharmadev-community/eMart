import 'dart:async';
import 'package:hive_cache/hive_cache.dart';
import 'package:repositories/src/models/user_activity.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:firebase_database/firebase_database.dart' as db;
import 'package:shared/firebase_service.dart';
part 'user_activity_api.dart';
part 'user_activity_cache.dart';

class UserActivityRepository {
  final UserActivityApi api;
  final UserActivityCache cache;
  UserActivityRepository({required String uid})
      : api = UserActivityApi(uid),
        cache = UserActivityCache();

  Future<UserActivity?> get() async {
    UserActivity? result = cache.get();
    result ??= await api.get();
    if (result != null) cache.set(result);
    return result;
  }

  Future<UserActivity> addVisitedProduct(String id) async {
    logs.i("UserActivityApi:addVisitedProduct($id) initiating");
    await api.addVisitedProduct(id);
    return cache.addVisitedProduct(id);
  }

  Future<UserActivity> addSuggestionKeywords(List<String> ids) async {
    logs.i("UserActivityApi:addVisitedProduct($ids) initiating");
    await api.addSuggestionKeywords(ids);
    return cache.addSuggestionKeywords(ids);
  }
}
