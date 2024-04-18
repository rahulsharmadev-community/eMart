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
    await productsCol.doc(product.productId).set(product.toJson()).then((value) => product);
  }

  Future<List<Product>> getByQueries(Set<Query> queries,
      {DescendingSortBy sortBy = DescendingSortBy.reviews}) async {
    logs.i('ProductsApi: getByQueries');

    if (queries.isEmpty) return const [];

    List<Product> list = [];

    onValue(snap) {
      for (var e in snap.docs) {
        if (e.data() != null) list.add(Product.fromJson(e.data()! as JSON));
      }
    }

    var combineFilter = Query.combineFilter(queries.toList());

    var query = productsCol.where(combineFilter);

    // fs.Order();

    await query.orderBy(sortBy.field, descending: true).limit(30).get().then(onValue);

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
