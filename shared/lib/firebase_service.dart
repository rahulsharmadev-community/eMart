// ignore_for_file: avoid_print

library credentials;

export 'src/credentials/free_apis.dart';
export 'src/credentials/emart-consumer-only.dart';
export 'src/credentials/emart-mix.dart';
export 'src/credentials/emart-seller-only.dart';
import 'dart:async';
import 'package:shared/src/credentials/firebase_credential.dart';
import 'src/credentials/emart-consumer-only.dart';
import 'src/credentials/emart-seller-only.dart';
import 'src/credentials/emart-mix.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as core;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseService {
  static core.FirebaseApp get eMartConsumer {
    var name = eMartConsumerFirebaseCredential.instance.name;
    return (_current == name) ? core.Firebase.app() : core.Firebase.app(name);
  }

  static core.FirebaseApp get eMartSeller {
    var name = eMartSellerFirebaseCredential.instance.name;
    return (_current == name) ? core.Firebase.app() : core.Firebase.app(name);
  }

  static core.FirebaseApp get eMartMix {
    var name = eMartMixFirebaseCredential.instance.name;
    return (_current == name) ? core.Firebase.app() : core.Firebase.app(name);
  }

  static late String _current;
  static Future<void> initialize(FirebaseCredential primary, {bool enablePre = false}) async {
    _current = primary.name;

    // var setting = FirebaseFirestore.instanceFor(app: eMartConsumer).settings;

    await Future.wait([
      eMartConsumerFirebaseCredential.instance,
      eMartSellerFirebaseCredential.instance,
      eMartMixFirebaseCredential.instance
    ].map((credential) {
      return core.Firebase.initializeApp(
              name: (_current == credential.name) ? core.defaultFirebaseAppName : credential.name,
              options: credential.currentPlatform)
          .then((value) => print('eMartConsumerFirebaseOptions SuccessFull'))
          .catchError((e) => print(e.toString()));
    }));
  }
}

extension FirebaseAppExt on core.FirebaseApp {
  FirebaseAuth get instanceOfAuth => FirebaseAuth.instanceFor(app: this);
  FirebaseFirestore get instanceOfFirestore => FirebaseFirestore.instanceFor(app: this);
  FirebaseDatabase get instanceOfDatabase => FirebaseDatabase.instanceFor(app: this);
  FirebaseStorage get instanceOfStorage => FirebaseStorage.instanceFor(app: this);
}
