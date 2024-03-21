import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_database/firebase_database.dart' as db;
import 'package:repositories/src/extenstion.dart';
import 'package:repositories/src/models/product_model.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';

class ProductsApi {
  final fs.CollectionReference collection;
  final db.DatabaseReference metaDataReference;

  ProductsApi({fs.FirebaseFirestore? firestore})
      : collection = FirebaseService.eMartSeller.instanceOfFirestore.collection('PRODUCTS'),
        metaDataReference = FirebaseService.eMartMix.instanceOfDatabase.ref('PRODUCTS-METADATA');

  Future<List<ProductModel>> getByKeyword() async {
    return <ProductModel>[];
  }

  Future<ProductModel?> getByProductId(String productId) async {
    var review = const ProductMetaData();
    await Future.wait([
      viewIncrement(productId), // increase the view count at database.
      _getProductMetaData(productId).then((value) => review = value), // get fresh product metadata.
    ]);

    try {
      final resp2 = await collection.doc(productId).get(); // get product from database
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

  Future<void> viewIncrement(String productId) async {
    var now = DateTime.now();
    var child = metaDataReference.child('$productId/monthly-activities/${now.month}${now.year}/views');
    await child.set(db.ServerValue.increment(1));
  }

  // ignore: unused_element
  Future<void> reachIncrement(String productId) async {
    var now = DateTime.now();
    var child = metaDataReference.child('$productId/monthly-activities/${now.month}${now.year}/reach');
    await child.set(db.ServerValue.increment(1));
  }

  Future<ProductMetaData> _getProductMetaData(String productId) async {
    var now = DateTime.now();
    var key = '${now.month - 1}${now.year}';
    var future = await Future.wait([
      metaDataReference.child('$productId/monthly-activities/ratings').get(),
      metaDataReference.child('$productId/monthly-activities/$key').get(),
    ]);

    return ProductMetaData.fromJson(future.first.value as JSON? ?? {}).copyWith(
      monthlyActivities: {key: MonthlyActivities.fromJson(future.last.value as JSON? ?? {})},
    );
  }
}
