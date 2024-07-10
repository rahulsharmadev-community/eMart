import 'dart:async';
import 'dart:convert';

import 'package:jars/jars_core.dart';
import '/repositories.dart';
import '/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
import 'package:firebase_database/firebase_database.dart' as db;

part 'policies_api.dart';
part 'policies_cache.dart';

// ignore: camel_case_types
class eMartPoliciesRepository {
  final eMartPoliciesApi api = eMartPoliciesApi();
  final eMartPoliciesCache cache = eMartPoliciesCache();

  Future<Policies?> get() async {
    Policies? result = cache.get();
    if (result == null) {
      result = await api.getComplete();
      if (result != null) cache.set(result);
    }
    return result;
  }
}
