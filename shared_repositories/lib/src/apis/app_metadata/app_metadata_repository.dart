import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import '/repositories.dart';
import '/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
part 'app_metadata_api.dart';

class AppMetaDataRepository {
  final AppMetaDataApi api;
  AppMetaDataRepository(String lang) : api = AppMetaDataApi(lang);

  Stream<AppMetaData?> get stream => api.stream;
}
