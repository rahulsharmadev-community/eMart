
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'
    show EmailAuthProvider, FirebaseUIAuth, PhoneAuthProvider;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:jars/jars.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:razorpay_api/razorpay_api.dart';
import 'package:shared/firebase_service.dart';
import 'package:shopping/modules/flutter_app_run.dart';
import 'package:hive_cache/hive_cache.dart';


// Future<JSON?> getDeviceInfoIfValidPlatform() async {
//   if (!(Platform.isAndroid || Platform.isWeb)) return null;
//
//   var info = await DeviceInfoPlugin().deviceInfo;
//   if (info is AndroidDeviceInfo && !info.isPhysicalDevice) return null;
//
//   return info.data;
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var deviceInfo = await getDeviceInfoIfValidPlatform();
  // if (deviceInfo == null) return;

  final instance = eMartConsumerFirebaseCredential.instance;
  await FirebaseService.initialize(instance);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
    GoogleProvider(clientId: instance.clientId),
  ], app: FirebaseService.eMartConsumer);
  
  RazorPayAPI.init(keyId: 'rzp_test_iMZ2GgUhlVxhGv', keySecret: 'SGuRrmz5vFc2LUsfW9OSXcjV');
  // RazorPayAPI.init(keyId: 'rzp_live_ReDsJk9U51JDTc', keySecret: 'GHVq0iJtwkbAAmj0mR0ZTcSu');

  Bloc.observer = FlutterBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: Platform.isWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  await HiveStorage.build(
      storageDirectory:
          Platform.isWeb ? HiveStorage.webStorageDirectory : await getApplicationDocumentsDirectory());

  final auth = FirebaseService.eMartConsumer.instanceOfAuth;
  runApp(eMartShoppingAppRunner(auth: auth));
}
