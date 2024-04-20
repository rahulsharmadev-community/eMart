import 'dart:async';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:firebase_database/firebase_database.dart' as db;
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
part 'reviews_api.dart';
part 'reviews_cache.dart';

class ReviewsRepository {
  final ReviewsApi api;
  final ReviewsCache cache;
  ReviewsRepository({required this.api, required this.cache});

  FutureOr<List<Review>?> getReviews(String productId) async {
    List<Review>? result = cache.get(productId);
    if (result == null || result.isEmpty) {
      result = await api.getByProductId(productId);
      if (result.isNotEmpty) cache.add(productId, result);
    }
    return result;
  }
}
