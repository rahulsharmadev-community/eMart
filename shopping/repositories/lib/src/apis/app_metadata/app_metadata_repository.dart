import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
part 'app_metadata_api.dart';

class AppMetaDataRepository {
  final AppMetaDataApi api;
  AppMetaDataRepository({required this.api});

  Stream<AppMetaData?> get stream => api.stream;
}
