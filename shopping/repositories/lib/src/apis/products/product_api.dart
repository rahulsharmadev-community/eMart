part of 'products_repository.dart';

class ProductsApi {
  final fs.CollectionReference productsCol;
  final db.DatabaseReference metaDataReference;

  ProductsApi({fs.FirebaseFirestore? firestore})
      : productsCol = FirebaseService.eMartSeller.instanceOfFirestore.collection('PRODUCTS'),
        metaDataReference = FirebaseService.eMartMix.instanceOfDatabase.ref('PRODUCTS-METADATA');

  Future<List<Product>> getProductsByIds(List<String> productIds) async {
    List<Product> list = [];
    reachIncrement(productIds);
    await productsCol.where(KeywordQuery(productIds).applyFilter()).get().then((snap) {
      for (var e in snap.docs) {
        if (e.data() != null) list.add(Product.fromJson(e.data()! as JSON));
      }
    });
    return list;
  }

  Future<Product?> getByProductId(String productId) async {
    try {
      final resp2 = await productsCol.doc(productId).get(); // get product from database
      if (resp2.data() != null) return Product.fromJson(resp2.data()! as JSON);
    } catch (e) {
      logs.e(e);
    }
    return null;
  }

  Future<void> addNewProduct(Product product) async {
    await productsCol
        .doc(product.productId)
        .set(product.toJson())
        .then((value) => product)
        .catchError((e) => logs.e(e));
  }

  Future<List<Product>> getByQueries(List<Query> queries, {DescendingSortBy? sortBy}) async {
    if (queries.isEmpty) return const [];

    List<Product> list = [];

    onValue(snap) {
      for (var e in snap.docs) {
        if (e.data() != null) list.add(Product.fromJson(e.data()! as JSON));
      }
    }

    var query = productsCol.where(Query.combineFilter(queries));

    if (sortBy != null) {
      await query.orderBy(sortBy.field, descending: true).get().then(onValue);
    } else {
      await query.get().then(onValue);
    }

    return list;
  }

  Future<void> viewIncrement(Iterable<String> productIds) async {
    var now = DateTime.now();
    JSON map = {};
    for (var e in productIds) {
      map.addAll({'$e/monthly-activities/${now.month}${now.year}/views': db.ServerValue.increment(1)});
    }
    await metaDataReference.update(map);
  }

  Future<void> reachIncrement(Iterable<String> productIds) async {
    var now = DateTime.now();
    JSON map = {};
    for (var e in productIds) {
      map.addAll({'$e/monthly-activities/${now.month}${now.year}/reach': db.ServerValue.increment(1)});
    }

    await metaDataReference.update(map);
  }
}

// fs.Filter _getFilter(Query query) {
//   switch (query) {
//     case PriceQuery _:
//       return fs.Filter(query.field, isGreaterThanOrEqualTo: query.min, isLessThanOrEqualTo: query.max);
//     case DiscountQuery _:
//       return fs.Filter(query.field, isGreaterThanOrEqualTo: query.discount);
//     case KeywordQuery _:
//       return fs.Filter(query.field, arrayContainsAny: query.value);
//     case ReplacementQuery _:
//       return fs.Filter(query.field, isNull: false);
//     case RefundQuery _:
//       return fs.Filter(query.field, isNull: false);
//     case AfterSalesServiceQuery _:
//       return fs.Filter(query.field, isNull: false, isEqualTo: query.seviceId);
//     case CategoriesQuery _:
//       return fs.Filter(query.field, arrayContainsAny: query.value);
//     case ReviewQuery _:
//       return fs.Filter(query.field, isGreaterThan: query.isGreaterThan);
//     case RatingQuery _:
//       return fs.Filter(query.field, isGreaterThan: query.isGreaterThan);
//     default:
//       return fs.Filter(query.field, arrayContainsAny: (query as FeaturesQuery).value);
//   }
// }
