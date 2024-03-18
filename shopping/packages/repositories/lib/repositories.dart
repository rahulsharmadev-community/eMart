library repositories;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'src/credentials/emart-consumer-only.dart';
import 'src/credentials/emart-seller-only.dart';
import 'src/credentials/emart-mix.dart';

Future<void> initializeRepository({({String host, int port})? emulator}) async {
  await Future.wait([
    Firebase.initializeApp(
      name: eMartConsumerFirebaseOptions.name,
      options: eMartConsumerFirebaseOptions.currentPlatform,
    ),
    Firebase.initializeApp(
      name: eMartSellerFirebaseOptions.name,
      options: eMartSellerFirebaseOptions.currentPlatform,
    ),
    Firebase.initializeApp(
      name: eMartMixFirebaseOptions.name,
      options: eMartMixFirebaseOptions.currentPlatform,
    ),
  ]);

  if (emulator != null) {
    FirebaseDatabase.instance.useDatabaseEmulator(emulator.host, emulator.port);
    FirebaseStorage.instance.useStorageEmulator(emulator.host, emulator.port);
    FirebaseAuth.instance.useAuthEmulator(emulator.host, emulator.port);
    FirebaseAuth.instance.useAuthEmulator(emulator.host, emulator.port);
  }
}
