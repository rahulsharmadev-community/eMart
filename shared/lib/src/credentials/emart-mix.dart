import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:shared/src/credentials/firebase_credential.dart';

// ignore: camel_case_types
class eMartMixFirebaseCredential extends FirebaseCredential {
  const eMartMixFirebaseCredential._();
  static const _instance = eMartMixFirebaseCredential._();
  static eMartMixFirebaseCredential get instance => _instance;

  @override
  String get name => '[EMARTMIX]';

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
        apiKey: 'AIzaSyBX0bQvdLZSyMMfuWDpx4-3AfmWIBoSB0k',
        appId: '1:321032932616:web:c2c0518aed601f30b830bd',
        databaseURL: 'https://emart-mix-default-rtdb.asia-southeast1.firebasedatabase.app',
        messagingSenderId: '321032932616',
        projectId: 'emart-mix',
        authDomain: 'emart-mix.firebaseapp.com',
        storageBucket: 'emart-mix.appspot.com',
      );

  FirebaseOptions get android => const FirebaseOptions(
        apiKey: 'AIzaSyDqi1hseHYAQnFOCfvFJtf-drYHrOSR_X4',
        appId: '1:321032932616:android:4af314b62621b145b830bd',
        databaseURL: 'https://emart-mix-default-rtdb.asia-southeast1.firebasedatabase.app',
        messagingSenderId: '321032932616',
        projectId: 'emart-mix',
        storageBucket: 'emart-mix.appspot.com',
      );

  @override
  String get clientId => '';
}
