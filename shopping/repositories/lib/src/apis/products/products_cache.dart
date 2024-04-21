// ignore_for_file: library_private_types_in_public_api

part of 'products_repository.dart';

class ProductsCache extends HiveCache<JSON<_ProductsCached>> {
  ProductsCache() : super({});

  DateTime get generateExpiry => DateTime.now().add(1.hours);

  Product? get(String id) {
    _clearExpiryDate();
    return state[id]?.product;
  }

  void add(Product product) {
    state[product.productId] = _ProductsCached(product, generateExpiry);
  }

  void addAll(List<Product> products) {
    if (products.isEmpty) return;
    logs.i('ProductsCache: addAll($products)');
    var expiry = generateExpiry;
    state.addAll({for (var e in products) e.productId: _ProductsCached(e, expiry)});
  }

  void remove(String key) => state.remove(key);

  bool contains(String key) => state.containsKey(key);

  void clearAll() => state.clear();

  void _clearExpiryDate() {
    var now = DateTime.now();
    state.removeWhere((key, value) => value.expiry.isBefore(now));
  }

  @override
  JSON<_ProductsCached> fromJson(JSON json) =>
      json.map((key, value) => MapEntry(key, _ProductsCached.fromJson(value)));

  @override
  JSON toJson(JSON<_ProductsCached> state) => state.map((key, value) => MapEntry(key, value.toJson()));
}

class _ProductsCached {
  final Product product;
  final DateTime expiry;

  _ProductsCached(this.product, this.expiry);
  @override
  int get hashCode => product.productId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is _ProductsCached && other.product.productId == product.productId;
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'expiry': expiry.toIso8601String(),
    };
  }

  factory _ProductsCached.fromJson(Map<String, dynamic> json) {
    return _ProductsCached(
      Product.fromJson(json['product']),
      DateTime.parse(json['expiry']),
    );
  }
}
