part of 'categories_repository.dart';

class CategoriesApi {
  final cf.CollectionReference _collection;
  CategoriesApi({String lang = 'en'})
      : _collection =
            FirebaseService.eMartConsumer.instanceOfFirestore.collection('AppMetaData/$lang/categories');

  final _limit = 30;
  Future<List<Category>> getByKey(List<String> ids) async {
    logs.i("CategoriesApi:getByKey($ids) initiating");
    if (ids.isEmpty) return [];

    final result = await Future.wait(ids.chunked(_limit).map((e) => _collection
        .where(cf.FieldPath.documentId, whereIn: e)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                Category.fromJson((snapshot.data()!)..addAll({'id': snapshot.id})),
            toFirestore: (value, options) => value.toJson())
        .get()));

    return result
        .map((e) => e.docs.map((e) => e.data()))
        .reduce((value, element) => [...value, ...element])
        .toList();
  }

  Future<List<Category>> getAll() async {
    logs.i("CategoriesApi:getAll() initiating");

    final response = await _collection.get();
    var result = response.docs.map((e) {
      return Category.fromJson((e.data() as JSON)..addAll({'id': e.id}));
    }).toList();

    return result;
  }
}
