import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

// ignore: camel_case_types
class eMartConsumerFirebaseOptions {
  static String get name => currentPlatform.projectId;
  static const String clientId = '958085585998-hc8mpd460mard38fg6el3o18kq6ujsnj.apps.googleusercontent.com';
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
      apiKey: 'AIzaSyD2Eol3p8-ZgWgmNauDREnFe1BS8rygWqk',
      appId: '1:958085585998:web:4281cbdcc8200403dc771f',
      messagingSenderId: '958085585998',
      projectId: 'emart-consumer-only',
      authDomain: 'emart-consumer-only.firebaseapp.com',
      storageBucket: 'emart-consumer-only.appspot.com',
      measurementId: 'G-NC6L5MQYQ8',
      databaseURL: 'https://emart-consumer-only-default-rtdb.asia-southeast1.firebasedatabase.app',
      iosClientId: clientId,
      androidClientId: '958085585998-hc8mpd460mard38fg6el3o18kq6ujsnj.apps.googleusercontent.com');

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyCCcLlBl15CtGfPvz4RunIxwt-KsjK3yH0',
      appId: '1:958085585998:android:bef834deaea7f412dc771f',
      messagingSenderId: '958085585998',
      projectId: 'emart-consumer-only',
      storageBucket: 'emart-consumer-only.appspot.com',
      databaseURL: 'https://emart-consumer-only-default-rtdb.asia-southeast1.firebasedatabase.app',
      iosClientId: clientId,
      androidClientId: '958085585998-hc8mpd460mard38fg6el3o18kq6ujsnj.apps.googleusercontent.com');
}
