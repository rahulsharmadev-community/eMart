part of 'reviews_repository.dart';

class ReviewsApi {
  final db.DatabaseReference _reference = FirebaseService.eMartConsumer.instanceOfDatabase.ref('REVIEWS');

  Future<List<Review>> getByProductId(String id) async {
    logs.i("ReviewsApi:get($id) initiating");
    if (id.isEmpty) return [];
    final response = await _reference.child(id).get();

    if (response.value == null) return [];
    var result = (response.value as List).map((e) => Review.fromJson(Map<String, dynamic>.from(e))).toList();
    return result;
  }
}
