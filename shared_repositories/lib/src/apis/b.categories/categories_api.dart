part of 'categories_repository.dart';

class CategoriesApi {
  CategoriesApi();

  Future<JSON?> get() {
    return asyncGuard<JSON>(() async {
      final response = await http.get(PRODUCT_CATEGORIES_API.uri());

      if (response.statusCode != 200) {
        logs.e("CategoriesApi:get() failed with status code ${response.statusCode}");
        throw Exception("Failed to load categories");
      }

      return jsonDecode(response.body) as JSON;
    }, reThrow: true);
  }
}
