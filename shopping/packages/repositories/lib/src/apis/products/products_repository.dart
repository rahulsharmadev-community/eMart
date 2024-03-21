import "package:repositories/src/apis/products/product_api.dart";
import "package:repositories/src/apis/products/products_cache.dart";
import "package:repositories/src/models/product_model.dart";
import 'dart:async';

class ProductRepository {
  final ProductsApi api;
  final ProductsCache cache;
  ProductRepository({required this.api, required this.cache});

  FutureOr<ProductModel?> get(String productId) async {
    ProductModel? result = cache.get(productId);
    if (result == null) {
      result = await api.getByProductId(productId);
      if (result != null) cache.add(result);
    } else {
      api.viewIncrement(productId);
    }
    return result;
  }

  
}
