import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseCredential {
  const FirebaseCredential();
  FirebaseOptions get currentPlatform;

  String get name;

  String get clientId;
}
