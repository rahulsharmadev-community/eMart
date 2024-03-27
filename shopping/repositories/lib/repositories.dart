library repositories;

export 'src/apis/order_api.dart';
export 'src/apis/primary_user_api.dart';
export 'src/apis/keywords/keywords_repository.dart';
export 'src/extenstion.dart';
export 'src/models/query.dart';
export 'src/models/product_model.dart';
export 'src/apis/products/products_repository.dart';
export 'src/apis/app_metadata/app_metadata_repository.dart';
export 'src/models/appmetadata.dart';
export 'src/models/categories.dart';
export 'src/models/policies.dart';

import 'dart:async';
import 'src/extenstion.dart';
import 'package:shared/credentials.dart';

Future<void> initializeRepository({bool emulator = false}) async {
  await FirebaseService.initialize();

  if (emulator) {
    const host = 'localhost';
    // eMartConsumer
    await FirebaseService.eMartConsumer.instanceOfAuth.useAuthEmulator(host, 9201);
    FirebaseService.eMartConsumer.instanceOfFirestore.useFirestoreEmulator(host, 9202);
    FirebaseService.eMartConsumer.instanceOfDatabase.useDatabaseEmulator(host, 9203);
    await FirebaseService.eMartConsumer.instanceOfStorage.useStorageEmulator(host, 9204);

    // // eMartSeller
    await FirebaseService.eMartSeller.instanceOfAuth.useAuthEmulator(host, 7201);
    FirebaseService.eMartSeller.instanceOfFirestore.useFirestoreEmulator(host, 7202);
    FirebaseService.eMartSeller.instanceOfDatabase.useDatabaseEmulator(host, 7203);
    await FirebaseService.eMartSeller.instanceOfStorage.useStorageEmulator(host, 7204);

    // eMartMix
    FirebaseService.eMartMix.instanceOfFirestore.useFirestoreEmulator(host, 8201);
    FirebaseService.eMartMix.instanceOfDatabase.useDatabaseEmulator(host, 8202);
    await FirebaseService.eMartMix.instanceOfStorage.useStorageEmulator(host, 8203);
  }
}
