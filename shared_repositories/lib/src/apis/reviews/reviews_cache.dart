// ignore_for_file: avoid_function_literals_in_foreach_calls

part of 'reviews_repository.dart';

class ReviewsCache {
  final JSON<List<Review>> cache = {};

  void add(String productId, List<Review> reviews) {
    logs.i("ReviewsCache:add() initiating");
    cache[productId] = reviews;
  }

  List<Review>? get(String productId) {
    logs.i("ReviewsCache:get() initiating");
    return cache[productId];
  }
}
