import "package:hydrated_bloc/hydrated_bloc.dart";
import "package:jars/extensions.dart";
import "package:shared/models.dart";
import "package:shopping/blocs/cached/cached_limit.dart";

typedef ProductCachedModel = JSON<({Product product, DateTime lastUpdateAt})>;

class ProductsCubit extends HydratedCubit<ProductCachedModel> {
  ProductsCubit() : super(const {}) {
    _removeOldProducts();
  }

  Product? getByProductId(String id) => state[id]?.product;

  List<Product> getByProductIds(List<String> ids) {
    final temp = <Product>[];
    for (var id in ids) {
      var pro = state[id]?.product;
      if (pro != null) temp.add(pro);
    }
    return temp;
  }

  void add(Product product) {
    if (_checkOverFlow) return;
    final temp = {...state};
    temp[product.productId] = (product: product, lastUpdateAt: DateTime.now());
    emit(temp);
  }

  void addALL(List<Product> products) {
    if (_checkOverFlow) return;

    final temp = {...state};
    for (var pro in products) {
      temp[pro.productId] = (product: pro, lastUpdateAt: DateTime.now());
    }
    emit(temp);
  }

  void _removeOldProducts() {
    if (state.isEmpty) return;
    final temp = {...state};
    final threshold = DateTime.now().subtract(120.days);
    temp.removeWhere((k, v) {
      return v.lastUpdateAt < threshold;
    });
    emit(temp);
  }

  bool get _checkOverFlow => state.length >= productsCachedLimit;

  @override
  ProductCachedModel? fromJson(Map<String, dynamic> json) {
    return json.map((key, value) {
      return MapEntry(key, (
        product: Product.fromJson(json['product']),
        lastUpdateAt: DateTime.fromMillisecondsSinceEpoch(json['lastUpdateAt'])
      ));
    });
  }

  @override
  Map<String, dynamic>? toJson(ProductCachedModel state) {
    return state.map((key, value) {
      return MapEntry(key, {
        'product': value.product.toJson(),
        'lastUpdateAt': value.lastUpdateAt.millisecondsSinceEpoch,
      });
    });
  }
}
