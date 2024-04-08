import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_database/firebase_database.dart' as db;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';

part 'product_api.dart';
part 'products_cache.dart';

class ProductRepository {
  final ProductsApi api;
  final ProductsCache cache;
  ProductRepository({required this.api, required this.cache});

  FutureOr<Product?> get(String productId) async {
    Product? result = cache.get(productId);
    if (result == null) {
      result = await api.getByProductId(productId);
      if (result != null) cache.add(result);
    } else {
      api.viewIncrement([productId]);
    }
    return result;
  }

  FutureOr<List<Product>> getByQuery(List<Query> queries) async {
    final result = await api.getByQueries(queries);
    cache.addAll(result);
    return result;
  }
}
