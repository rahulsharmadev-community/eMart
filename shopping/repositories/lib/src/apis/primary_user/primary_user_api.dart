// ignore_for_file: no_wildcard_variable_uses

import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:razorpay_api/razorpay_api.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
import 'package:jars/jars.dart';

class PrimaryUserRepository {
  final cf.DocumentReference _collection;
  final String uid;
  PrimaryUserRepository(this.uid)
      : _collection = FirebaseService.eMartConsumer.instanceOfFirestore.collection('USERS').doc(uid);

  static Future<void> createNewUser(Consumer value) async {
    try {
      var razorPayUid = await createRazorpayUid(value);
      var json = value.copyWith.razorPayUid(razorPayUid).toJson();
      await FirebaseService.eMartConsumer.instanceOfFirestore
          .collection('USERS')
          .doc(value.uid)
          .set(json)
          .then((_) => logs.i(value.toJson()))
          .catchError((e) => logs.e(e));
    } catch (e) {
      logs.e(e);
    }
  }

  Future<Consumer?> get() async {
    try {
      final resp = await _collection
          .withConverter(
              fromFirestore: (_, s) => Consumer.fromJson(_.data()!), toFirestore: (_, s) => _.toJson())
          .get();
      logs.d('Success: ${resp.data()?.toJson()}');
      return resp.data();
    } catch (e) {
      logs.e(e);
    }
    return null;
  }

  Stream<Consumer?> get getStream {
    return _collection
        .withConverter(
          fromFirestore: (_, s) => Consumer.fromJson(_.data()!),
          toFirestore: (_, s) => _.toJson(),
        )
        .snapshots()
        .map((event) => event.data());
  }

  Future<void> update({required Consumer oldValue, required Consumer newValue}) async {
    var diff = newValue.toJson().subtract(oldValue.toJson());
    try {
      if (newValue.razorPayUid == null) {
        newValue = newValue.copyWith(razorPayUid: await createRazorpayUid(newValue));
      }
      if (_canRazorPayEdit(diff)) {
        await const RazorPayCustomerAPI()
            .editByCustomerId(newValue.razorPayUid!, newValue.convertToRazorpayInstance);
      }
      await _collection.update(newValue.toJson());
    } catch (e) {
      print('Error PrimaryUser.update $e');
      logs.e(e);
    }
  }

  static Future<String> createRazorpayUid(Consumer customer) async {
    try {
      var resp = await const RazorPayCustomerAPI().createCustomer(customer.convertToRazorpayInstance);
      return resp.id;
    } on Exception {
      rethrow;
    }
  }
}

const _razorPayCustomerPram = ['name', 'email', 'phoneNumber', 'gstNumber'];
_canRazorPayEdit(Map diff) => _razorPayCustomerPram.any((e) => diff.containsKey(e));

extension on Consumer {
  RazorPayCustomer get convertToRazorpayInstance => RazorPayCustomer(
      name: name.toString(),
      email: email,
      contact: phoneNumber ?? '',
      gstin: gstNumber ?? '',
      notes: {'uid': uid},
      failExisting: false);
}

// extension MapExtensions<K, V> on Map<K, V> {
//   /// Compare two elements for being equal.
//   bool equals(Map<K, V> other) => const DeepCollectionEquality().equals(this, other);

//   void removeAll(List<K> keys) => keys.forEach((key) => remove(key));

//   /// Returns a new map containing all key-value pairs in this map
//   /// except those that are present in the [other] map.
//   ///
//   /// Optionally, you can specify whether to compare only keys ([compareOnlyKey]).
//   Map<K, V> subtract(Map<K, V> other, {bool compareOnlyKey = false}) {
//     if (other.isEmpty) return this;
//     var map = {...this};
//     const deep = DeepCollectionEquality();
//     other.forEach((key, value) {
//       if (this[key] is Map && other[key] is Map) {
//         var subtract = (this[key] as Map).subtract(other[key] as Map);
//         subtract.isEmpty ? map.remove(key) : map[key] = subtract as V;
//       } else if (compareOnlyKey || deep.equals(map[key], value)) {
//         map.remove(key);
//       }
//     });
//     return map;
//   }
// }
