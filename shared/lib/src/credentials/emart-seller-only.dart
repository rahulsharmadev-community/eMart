// ignore_for_file: camel_case_types

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:shared/src/credentials/firebase_credential.dart';

class eMartSellerFirebaseCredential extends FirebaseCredential {
  const eMartSellerFirebaseCredential._();
  static const _instance = eMartSellerFirebaseCredential._();
  static eMartSellerFirebaseCredential get instance => _instance;

  @override
  String get name => '[EMARTSELLERONLY]';

  @override
  FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  FirebaseOptions get web => const FirebaseOptions(
        apiKey: 'AIzaSyCUFy_Vwc_S_9qi_rYUu1GKJyqxanLIv7g',
        appId: '1:749696932223:web:ce6a9b83420724c6fba24a',
        messagingSenderId: '749696932223',
        projectId: 'emart-seller-only',
        authDomain: 'emart-seller-only.firebaseapp.com',
        databaseURL: 'https://emart-seller-only-default-rtdb.asia-southeast1.firebasedatabase.app',
        storageBucket: 'emart-seller-only.appspot.com',
        measurementId: 'G-ZKJXFM9PL1',
      );

  FirebaseOptions get android => const FirebaseOptions(
        apiKey: 'AIzaSyCDbs3xS80bTbjvb-Re0lH75AlUQ8aqlf0',
        appId: '1:749696932223:android:7727b5cebc9b29abfba24a',
        messagingSenderId: '749696932223',
        projectId: 'emart-seller-only',
        databaseURL: 'https://emart-seller-only-default-rtdb.asia-southeast1.firebasedatabase.app',
        storageBucket: 'emart-seller-only.appspot.com',
      );

  @override
  String get clientId => '';
}
