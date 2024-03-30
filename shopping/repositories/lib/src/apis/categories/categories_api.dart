part of 'categories_repository.dart';

class CategoriesApi {
  final cf.CollectionReference _collection;
  CategoriesApi({String lang = 'en'})
      : _collection =
            FirebaseService.eMartConsumer.instanceOfFirestore.collection('AppMetaData/$lang/categories');

  Future<List<Category>> getByKey(List<String> ids) async {
    logs.i("CategoriesApi:get($ids) initiating");
    if (ids.isEmpty) return [];

    final response = await _collection.where(cf.FieldPath.documentId, whereIn: ids).get();
    var result = response.docs.map((e) {
      return Category.fromJson((e.data() as JSON)..addAll({'id': e.id}));
    }).toList();

    return result;
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
