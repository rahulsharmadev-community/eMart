import 'dart:async';

import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shared/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;

part 'employees_api.dart';

// ignore: camel_case_types
class EmployeesRepository {
  final EmployeesApi api = EmployeesApi();

  Future<Seller?> getByEmail(String email) async {
    Seller? result = await api.getByEmail(email);
    return result;
  }

  Future<void> createNewEmployee(Employee employee) => api.createNewEmployee(employee);
}
