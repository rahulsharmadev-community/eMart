import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/credentials.dart';
part 'app_metadata_api.dart';
part 'app_metadata_cache.dart';

class AppMetaDataRepository {
  final AppMetaDataApi api;
  final AppMetaDataCache cache;
  AppMetaDataRepository({required this.api, required this.cache});

  FutureOr<AppMetaData?> get() async {
    AppMetaData? result = cache.get();
    if (result == null) {
      result = await api.getComplete();
      if (result != null) cache.set(result);
    }
    return result;
  }
}
