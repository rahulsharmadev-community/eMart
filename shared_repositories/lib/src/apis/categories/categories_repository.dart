import 'dart:async';
import 'package:jars/jars_core.dart';
import '/repositories.dart';
import '/src/utils/error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:shared/firebase_service.dart';
import 'package:hive_cache/hive_cache.dart';
part 'categories_api.dart';
part 'categories_cache.dart';

class CategoriesRepository {
  final CategoriesApi api;
  final CategoriesCache cache;

  CategoriesRepository(String lang)
      : api = CategoriesApi(lang),
        cache = CategoriesCache();

  Future<List<Category>?> get(List<String> ids) async {
    List<Category>? result = cache.get(ids);
    if (result.isEmpty) {
      result = await api.getByKey(ids);
      cache.set(result);
    }
    return result;
  }

  Future<List<Category>> getALL() async {
    final result = await api.getAll();
    cache.set(result);
    return result;
  }
}
