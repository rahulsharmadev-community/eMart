import 'package:bloc/bloc.dart';
import 'package:business/modules/flutter_app_runner.dart';
import 'package:flutter/material.dart';
import 'package:hive_cache/hive_cache.dart';
import 'package:razorpay_api/razorpay_api.dart';
import 'package:shared/firebase_service.dart';
import 'package:jars/jars.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = FlutterBlocObserver();
  await FirebaseService.initialize(eMartSellerFirebaseCredential.instance);
  RazorPayAPI.init(keyId: 'rzp_test_iMZ2GgUhlVxhGv', keySecret: 'SGuRrmz5vFc2LUsfW9OSXcjV');
  // RazorPayAPI.init(keyId: 'rzp_live_ReDsJk9U51JDTc', keySecret: 'GHVq0iJtwkbAAmj0mR0ZTcSu');

  await HiveStorage.build(storageDirectory: HiveStorage.webStorageDirectory);
  runApp(const eMartBusinessAppRunner());
}
