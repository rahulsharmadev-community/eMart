import 'package:firebase_ui_auth/firebase_ui_auth.dart'
    show EmailAuthProvider, FirebaseUIAuth, PhoneAuthProvider, setFirebaseUiIsTestMode;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:jars/jars.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/firebase_service.dart';
import 'package:shopping/modules/flutter_app_run.dart';
import 'package:shopping/utility/utility.dart';

final _instance = eMartConsumerFirebaseCredential.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize(_instance);
  await initializeRepository();

  // setFirebaseUiIsTestMode(true);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
    GoogleProvider(clientId: _instance.clientId),
  ], app: FirebaseService.eMartConsumer);

  Bloc.observer = FlutterBlocObserver();

  var storageDirectory =
      PlatformQuery.isWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storageDirectory)
      .whenComplete(() => print('HydratedBloc Complete'));
  await HiveStorage.build(storageDirectory: storageDirectory)
      .whenComplete(() => print('HiveStorage Complete'));

  runApp(const eMartShoppingAppRunner());
}
