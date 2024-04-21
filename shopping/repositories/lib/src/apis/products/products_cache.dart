// ignore_for_file: library_private_types_in_public_api

part of 'products_repository.dart';

class ProductsCache extends HiveCache<_ProductsCached> {
  DateTime get generateExpiry => DateTime.now().add(1.hours);

  Product? get(String id) {
    logs.i('ProductsCache:get');
    _clearExpiryDate();
    return getByKey(id)?.product;
  }

  void add(Product product) => putByKey(product.productId, _ProductsCached(product, generateExpiry));

  void addAll(List<Product> products) {
    var ex = generateExpiry;
    addJSON({for (var e in products) e.productId: _ProductsCached(e, ex)});
  }

  void remove(String key) => deleteByKey(key);

  bool contains(String key) => containsKey(key);

  void clearAll() => deleteAll();

  void _clearExpiryDate() {
    var now = DateTime.now();
    deleteWhere((e) => e.expiry.isBefore(now));
  }

  @override
  _ProductsCached fromJson(Map<String, dynamic> json) => _ProductsCached.fromJson(json);

  @override
  Map<String, dynamic> toJson(_ProductsCached state) => state.toJson();
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
