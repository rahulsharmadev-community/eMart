part of 'products_repository.dart';

class ProductsApi {
  final fs.CollectionReference productsCol;
  final db.DatabaseReference metaDataReference;

  ProductsApi({fs.FirebaseFirestore? firestore})
      : productsCol = FirebaseService.eMartSeller.instanceOfFirestore.collection('PRODUCTS'),
        metaDataReference = FirebaseService.eMartMix.instanceOfDatabase.ref('PRODUCTS-METADATA');

  Future<List<ProductModel>> getByKeywords(List<String> keywords) async {
    List<ProductModel> list = [];
    JSON<ProductMetaData> list2 = {};

    await productsCol.where('keywords', arrayContainsAny: keywords).get().then((snap) {
      for (var e in snap.docs) {
        if (e.data() != null) list.add(ProductModel.fromJson(e.data()! as JSON));
      }
    });

    var productIds = list.map((e) => e.productId).toList();

    await Future.wait([
      ...productIds.map((e) => _getProductMetaData(e).then((value) => list2.addAll(value))),
      reachIncrement(productIds)
    ]);

    return <ProductModel>[];
  }

  Future<List<ProductModel>> getProductsByIds(List<String> productIds) async {
    List<ProductModel> list = [];
    JSON<ProductMetaData> list2 = {};
    reachIncrement(productIds);
    var futures = [
      productsCol.where(fs.FieldPath.documentId, whereIn: productIds).get().then((snap) {
        for (var e in snap.docs) {
          if (e.data() != null) list.add(ProductModel.fromJson(e.data()! as JSON));
        }
      }),
      ...productIds.map((e) => _getProductMetaData(e).then((value) => list2.addAll(value)))
    ];
    await Future.wait(futures);

    return list.map((e) => e.copyWith(reviewMetaData: list2[e.productId])).toList();
  }

  Future<ProductModel?> getByProductId(String productId) async {
    var review = const ProductMetaData();
    await Future.wait([
      viewIncrement([productId]), // increase the view count at database.
      _getProductMetaData(productId)
          .then((value) => review = value[productId]!), // get fresh product metadata.
    ]);

    try {
      final resp2 = await productsCol.doc(productId).get(); // get product from database
      var data = resp2.data() as JSON?;
      if (data != null) {
        var productModel = ProductModel.fromJson(data).copyWith(reviewMetaData: review);
        return productModel;
      }
    } catch (e) {
      logs.e(e);
    }
    return null;
  }

  Future<ProductModel?> addNewProduct(Product product) async {
    try {
      await Future.wait([
        productsCol.doc(product.productId).set(product.toJson()),
        metaDataReference.child(product.productId).set(const ProductMetaData()),
      ]);
    } catch (e) {
      logs.e(e);
    }
    return null;
  }

  // Future<ProductModel?> getByKeywords(List<String> keywords) async {
  //   var review = const ProductMetaData();
  //   await Future.wait([
  //     viewIncrement(productId), // increase the view count at database.
  //     _getProductMetaData(productId).then((value) => review = value), // get fresh product metadata.
  //   ]);

  //   collection.where('keywords',arrayContainsAny: keywords)

  //   try {
  //     final resp2 = await collection.doc(productId).get(); // get product from database
  //     var data = resp2.data() as JSON?;
  //     if (data != null) {
  //       var productModel = ProductModel.fromJson(data).copyWith(reviewMetaData: review);
  //       return productModel;
  //     }
  //   } catch (e) {
  //     logs.e(e);
  //   }
  //   return null;
  // }

  Future<List<ProductModel>> getByQueries(List<Query> queries) async {
    if (queries.isEmpty) return const [];
    fs.Filter filter = _getFilter(queries.first);

    if (queries.length >= 2) {
      List<fs.Filter?> qs = List.filled(8, null);
      for (var i = 0; i < queries.length; i++) {
        qs[i] = _getFilter(queries[i]);
      }
      filter = fs.Filter.and(qs[0]!, qs[1]!, qs[2], qs[3], qs[4], qs[4], qs[5], qs[6], qs[7]);
    }

    List<ProductModel> list = [];
    await productsCol.where(filter).get().then((snap) {
      for (var e in snap.docs) {
        if (e.data() != null) list.add(ProductModel.fromJson(e.data()! as JSON));
      }
    });
    var list2 = {};
    await Future.wait(list.map((e) => _getProductMetaData(e.productId).then((value) => list2.addAll(value))));
    return list.map((e) => e.copyWith(reviewMetaData: list2[e.productId])).toList();
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

  Future<JSON<ProductMetaData>> _getProductMetaData(String productId) async {
    var now = DateTime.now();
    var key = '${now.month - 1}${now.year}';
    var future = await Future.wait([
      metaDataReference.child('$productId/monthly-activities/ratings').get(),
      metaDataReference.child('$productId/monthly-activities/$key').get(),
    ]);

    var value = ProductMetaData.fromJson(future.first.value as JSON? ?? {}).copyWith(
      monthlyActivities: {key: MonthlyActivities.fromJson(future.last.value as JSON? ?? {})},
    );
    return {productId: value};
  }
}

fs.Filter _getFilter(Query query) {
  switch (query) {
    case PriceQuery _:
      return fs.Filter("mrp", isGreaterThanOrEqualTo: query.min, isLessThanOrEqualTo: query.max);
    case DiscountQuery _:
      return fs.Filter("discount", isGreaterThanOrEqualTo: query.discount);
    case KeywordQuery _:
      return fs.Filter("keywords", arrayContainsAny: query.value);
    case ReplacementQuery _:
      return fs.Filter("replacement", isNull: false);
    case RefundQuery _:
      return fs.Filter("refund", isNull: false);
    case AfterSalesServiceQuery _:
      return fs.Filter("afterSalesServiceId", isNull: false);
    case CategoriesQuery _:
      return fs.Filter("categories", arrayContainsAny: query.value);
    default:
      return fs.Filter("features", arrayContainsAny: (query as FeaturesQuery).value);
  }
}
