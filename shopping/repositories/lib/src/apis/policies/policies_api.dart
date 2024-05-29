part of 'policies_repository.dart';

// ignore: camel_case_types
class eMartPoliciesApi {
  final db.DatabaseReference documentRef =
      FirebaseService.eMartConsumer.instanceOfDatabase.ref('AppPolicies');

  Future<Policies?> getComplete() async {
    logs.i("AppMetaDataApi:getComplete initiating");
    var result = await documentRef.get();
    if (result.value == null) return null;
    return Policies.fromJson(jsonDecode(result.value! as String));
  }
}
