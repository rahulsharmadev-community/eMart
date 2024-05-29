part of 'user_activity_repository.dart';

class UserActivityApi {
  final db.DatabaseReference _reference;
  final String uid;
  UserActivityApi(this.uid)
      : _reference = FirebaseService.eMartConsumer.instanceOfDatabase.ref('USER_ACTIVITY/$uid');

  Future<UserActivity?> get() async => await _reference.get().then((_) {
        if (_.value == null) return null;
        return UserActivity(
            suggestionKeywords:
                ((_.value as Map?)?['suggestionKeywords'] as Map?)?.keys.map((e) => e as String).toList(),
            visitedProducts:
                ((_.value as Map?)?['visitedProducts'] as Map?)?.keys.map((e) => e as String).toList());
      });

  Future<void> addVisitedProduct(String id) async {
    logs.i("UserActivityApi:addVisitedProduct($id) initiating");
    await _reference.child('visitedProducts').update({id: DateTime.now().millisecondsSinceEpoch});
  }

  Future<void> addSuggestionKeywords(List<String> ids) async {
    logs.i("UserActivityApi:addVisitedProduct($ids) initiating");
    var epoch = DateTime.now().millisecondsSinceEpoch;
    await _reference.child('suggestionKeywords').update({for (var e in ids) e: epoch});
  }
}
