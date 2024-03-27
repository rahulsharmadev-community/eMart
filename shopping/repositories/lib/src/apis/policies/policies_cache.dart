part of 'policies_repository.dart';

// ignore: camel_case_types
class eMartPoliciesCache {
  Policies? _data;
  DateTime? _expiry;

  void set(Policies data) {
    _data = data;
    _expiry = DateTime.now().add(2.minutes);
  }

  Policies? get() {
    logs.i("PoliciesCache:get() get");
    if (_data == null || _expiry!.isBefore(DateTime.now())) return null;
    return _data;
  }
}
