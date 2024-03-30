import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
part 'categories_api.dart';
part 'categories_cache.dart';

class CategoriesRepository {
  final CategoriesApi api;
  final CategoriesCache cache;
  CategoriesRepository({required this.api, required this.cache});

  Future<List<Category>?> get(List<String> ids) async {
    List<Category>? result = cache.get(ids);
    if (result == null) {
      result = await api.getByKey(ids);
      cache.set(result);
    }
    return result;
  }

  Future<List<Category>> getALL() async {
    final result =await cache.getAll()!;
    cache.set(result);
    return result;
  }
}
