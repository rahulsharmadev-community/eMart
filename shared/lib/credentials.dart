library credentials;

export 'src/credentials/other.dart';

import 'package:firebase_core/firebase_core.dart';
import 'src/credentials/emart-consumer-only.dart';
import 'src/credentials/emart-seller-only.dart';
import 'src/credentials/emart-mix.dart';

abstract class FirebaseService {
  static get clientId => eMartConsumerFirebaseOptions.clientId;
  static FirebaseApp get eMartConsumer => Firebase.app(eMartConsumerFirebaseOptions.name);
  static FirebaseApp get eMartSeller => Firebase.app(eMartSellerFirebaseOptions.name);
  static FirebaseApp get eMartMix => Firebase.app(eMartMixFirebaseOptions.name);

  static Future<void> initialize() => Future.wait([
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
}
