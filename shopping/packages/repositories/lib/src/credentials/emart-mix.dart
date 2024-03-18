import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

// ignore: camel_case_types
class eMartMixFirebaseOptions {
  static String get name => currentPlatform.projectId;
  static FirebaseOptions get currentPlatform {
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBX0bQvdLZSyMMfuWDpx4-3AfmWIBoSB0k',
    appId: '1:321032932616:web:c2c0518aed601f30b830bd',
    messagingSenderId: '321032932616',
    projectId: 'emart-mix',
    authDomain: 'emart-mix.firebaseapp.com',
    storageBucket: 'emart-mix.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqi1hseHYAQnFOCfvFJtf-drYHrOSR_X4',
    appId: '1:321032932616:android:4af314b62621b145b830bd',
    messagingSenderId: '321032932616',
    projectId: 'emart-mix',
    storageBucket: 'emart-mix.appspot.com',
  );
}
