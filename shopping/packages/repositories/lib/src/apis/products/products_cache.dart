import 'package:jars/extensions.dart';
import 'package:repositories/src/models/product_model.dart';
import 'package:shared/models.dart';

typedef ProductModels = JSON<({ProductModel product, DateTime expiry})>;

class ProductsCache {
  final ProductModels _cache = {};

  ProductModel? get(String id) {
    _clearExpiryDate();
    return _cache[id]?.product;
  }

  void add(ProductModel product) {
    var expiry = DateTime.now().add(2.minutes);
    _cache.addAll({product.productId: (product: product, expiry: expiry)});
  }

  void remove(String key) => _cache.remove(key);

  bool contains(String key) => _cache.containsKey(key);

  void clearAll() => _cache.clear();

  void _clearExpiryDate() {
    var now = DateTime.now();
    _cache.removeWhere((key, value) => value.expiry.isBefore(now));
  }
}
