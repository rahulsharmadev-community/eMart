import 'package:firebase_ui_auth/firebase_ui_auth.dart'
    show EmailAuthProvider, FirebaseUIAuth, PhoneAuthProvider, setFirebaseUiIsTestMode;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:jars/utility.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/credentials.dart';
import 'package:shopping/modules/flutter_app_run.dart';
import 'package:shopping/utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeRepository();
  // ignore: invalid_use_of_visible_for_testing_member
  // setFirebaseUiIsTestMode(true);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
    GoogleProvider(clientId: FirebaseService.clientId),
  ], app: FirebaseService.eMartConsumer);

  Bloc.observer = FlutterBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: PlatformQuery.isWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  runApp(const eMartShoppingAppRunner({}));
}
