import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:jars/jars.dart';
import 'package:repositories/src/extenstion.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';

class PrimaryUserApi {
  final cf.DocumentReference _collection;
  final String uid;
  PrimaryUserApi(this.uid, {cf.FirebaseFirestore? firestore})
      : _collection = FirebaseService.eMartConsumer.instanceOfFirestore.collection('USERS').doc(uid);

  static Future<void> createNewUser(Consumer value) async {
    await FirebaseService.eMartConsumer.instanceOfFirestore
        .collection('USERS')
        .doc(value.uid)
        .set(value.toJson())
        .then((_) => logs.i(value.toJson()))
        .catchError((e) => logs.e(e));
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
            fromFirestore: (_, s) => Consumer.fromJson(_.data()!), toFirestore: (_, s) => _.toJson())
        .snapshots()
        .map((event) => event.data());
  }

  Future<void> update(Consumer newValue, Consumer oldValue) async {
    try {
      await _collection.update(newValue.toJson().difference(oldValue.toJson()));
    } catch (e) {
      logs.e(e);
    }
  }
}
