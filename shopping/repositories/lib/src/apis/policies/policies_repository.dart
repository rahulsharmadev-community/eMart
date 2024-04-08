import 'dart:async';
import 'dart:convert';

import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/credentials.dart';
import 'package:firebase_database/firebase_database.dart' as db;

part 'policies_api.dart';
part 'policies_cache.dart';

// ignore: camel_case_types
class eMartPoliciesRepository {
  final eMartPoliciesApi api;
  final eMartPoliciesCache cache;
  eMartPoliciesRepository({required this.api, required this.cache});

  FutureOr<Policies?> get() async {
    Policies? result = cache.get();
    if (result == null) {
      result = await api.getComplete();
      if (result != null) cache.set(result);
    }
    return result;
  }
}
