// ignore_for_file: non_constant_identifier_names

import 'package:jars/jars.dart';
import 'hive_storage.dart';

abstract class HiveCache<T extends Object> {
  String get id => '';

  HiveStorage get _storage => HiveStorage.instance;

  String get _storagePrefix => runtimeType.toString();

  String get _storageToken => '$_storagePrefix$id';

  String _KEY(String key) => '$_storageToken.$key';

  JSON get getJson => _storage.toMap();

  List<dynamic> get values =>
      [for (var e in _storage.toMap().entries) e.key.startsWith(_storageToken) ? e.value : []];

  List<String> get keys => _storage.keys.toList().where((e) => e.startsWith(_storageToken)).toList();

  bool containsKey(String key) => _storage.containsKey(_KEY(key));

  T? getByKey(String key) {
    var temp = _storage.get(_KEY(key));
    if (temp == null) return null;
    return fromJson(temp);
  }

  Future<void> putByKey(String key, T value) async => _storage.put(_KEY(key), toJson(value));

  Future<void> addJSON(JSON<T> json) async {
    final jsonData = json.map((key, value) => MapEntry(_KEY(key), toJson(value)));
    return _storage.putAll(jsonData);
  }

  Future<void> deleteByKey(String key) async => _storage.delete(_KEY(key));

  Future<void> deleteByKeys(List<String> keys) async => _storage.deleteAll(keys.map((e) => _KEY(e)));

  Future<void> deleteWhere(bool Function(T) test) async {
    List<String> keys = [];
    _storage.toMap().entries.forEach((entry) {
      if (test(fromJson(entry.value))) keys.add(entry.key);
    });
    return _storage.deleteAll(keys);
  }

  Future<void> deleteAll() async {
    final keys = _storage.keys.toList().where((e) => e.startsWith(_storageToken));
    return _storage.deleteAll(keys);
  }

  T fromJson(JSON json);

  JSON toJson(T state);
}
