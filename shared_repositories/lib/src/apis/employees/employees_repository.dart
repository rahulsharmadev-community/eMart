import 'dart:async';

import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shared/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cf;

part 'employees_api.dart';

// ignore: camel_case_types
class EmployeesRepository {
  final EmployeesApi api = EmployeesApi();

  Future<Employee?> getByEmail(String email) async {
    Employee? result = await api.getByEmail(email);
    return result;
  }

  Future<void> createNewEmployee(Employee employee) => api.createNewEmployee(employee);
}
