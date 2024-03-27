part of 'products_repository.dart';

typedef ProductModels = JSON<ProductModel>;

class ProductsCache {
  final ProductModels _cache = {};

  ProductModel? get(String id) {
    _clearExpiryDate();
    return _cache[id];
  }

  void add(ProductModel product) {
    _cache.addAll({product.productId: product});
  }

  void addAll(List<ProductModel> products) {
    _cache.addAll({for (var e in products) e.productId: e});
  }

  void remove(String key) => _cache.remove(key);

  bool contains(String key) => _cache.containsKey(key);

  void clearAll() => _cache.clear();

  void _clearExpiryDate() {
    var now = DateTime.now();
    _cache.removeWhere((key, value) => value.expiry.isBefore(now));
  }
}
