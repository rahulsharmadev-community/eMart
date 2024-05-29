import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_database/firebase_database.dart' as db;
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
import 'package:hive_cache/hive_cache.dart';

part 'product_api.dart';
part 'products_cache.dart';

class ProductRepository {
  final ProductsApi api = ProductsApi();
  final ProductsCache cache = ProductsCache();

  Future<Product?> get(String productId, {bool disableCache = false}) async {
    Product? result = disableCache ? null : cache.get(productId);
    if (result == null) {
      result = await api.getByProductId(productId);
      if (result != null) cache.add(result);
    }
    api.viewIncrement([productId]);
    return result;
  }

  Future<List<Product>?> getAll(List<String> productIds, {bool disableCache = false}) async {
    List<Product>? result = disableCache ? null : cache.getAll(productIds);
    if (result == null) {
      result = await api.getProductsByIds(productIds);
      if (result != null) cache.addAll(result);
    }
    return result;
  }

  Future<List<Product>> getByQuery(Set<Query> queries) async {
    logs.i('ProductRepository: getByQuery');
    final result = await api.getByQueries(queries).whenComplete(() => print('Complete'));
    cache.addAll(result);
    logs.i(result);
    return result;
  }
}
