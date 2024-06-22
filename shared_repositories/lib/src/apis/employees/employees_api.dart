part of 'employees_repository.dart';

class EmployeesApi {
  final cf.CollectionReference cRef = FirebaseService.eMartSeller.instanceOfFirestore.collection('EMPLOYEES');

  Future<Employee?> getByEmail(String email) async {
    var result = await cRef
        .doc(email)
        .withConverter<Employee?>(
          fromFirestore: (snapshot, options) =>
              snapshot.data().ifNotNull(def: null, callback: (value) => Employee.fromJson(value)),
          toFirestore: (employee, options) => employee?.toJson() ?? {},
        )
        .get();
    return result.data();
  }

  Future<void> createNewEmployee(Employee employee) => cRef
      .doc(employee.email.value)
      .withConverter<Employee?>(
        fromFirestore: (snapshot, options) =>
            snapshot.data().ifNotNull(def: null, callback: (value) => Employee.fromJson(value)),
        toFirestore: (employee, options) => employee?.toJson() ?? {},
      )
      .set(employee);
}
