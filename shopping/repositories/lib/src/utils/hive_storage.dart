import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:synchronized/synchronized.dart';

/// Interface which is used to persist and retrieve state changes.
abstract class Storage {
  /// The name of the box. Names are always lowercase.
  String get name;

  /// Whether this box is currently open.
  ///
  /// Most of the operations on a box require it to be open.
  bool get isOpen;

  /// All the keys in the box.
  ///
  /// The keys are sorted alphabetically in ascending order.
  Iterable<String> get keys;

  /// The number of entries in the box.
  int get length;

  /// Returns `true` if there are no entries in this box.
  bool get isEmpty;

  /// Returns true if there is at least one entries in this box.
  bool get isNotEmpty;

  /// Checks whether the box contains the [key].
  bool containsKey(String key);

  /// Saves the [key] - [value] pair.
  Future<void> put(String key, dynamic value);

  /// Saves all the key - value pairs in the [entries] map.
  Future<void> putAll(Map<String, dynamic> entries);

  /// Deletes the given [key] from the box.
  ///
  /// If it does not exist, nothing happens.
  Future<void> delete(String key);

  /// Deletes all the given [keys] from the box.
  ///
  /// If a key does not exist, it is skipped.
  Future<void> deleteAll(Iterable<String> keys);

  /// Closes the box.
  ///
  /// Be careful, this closes all instances of this box. You have to make sure
  /// that you don't access the box anywhere else after that.
  Future<void> close();

  /// Flushes all pending changes of the box to disk.
  Future<void> flush();

  Iterable<dynamic> get values;

  dynamic get(String key, {dynamic defaultValue});

  Map<String, dynamic> toMap();
}

class StorageNotFound implements Exception {
  /// {@macro storage_not_found}
  const StorageNotFound();

  @override
  String toString() {
    return 'Storage was accessed before it was initialized.\n'
        'Please ensure that storage has been initialized.\n\n'
        'For example:\n\n'
        'HydratedBloc.storage = await HydratedStorage.build();';
  }
}

class HiveStorage implements Storage {
  final Box<dynamic> box;
  HiveStorage._(this.box);

  static HiveStorage? _instance;

  static HiveStorage get instance {
    if (_instance == null) throw const StorageNotFound();
    return _instance!;
  }

  static final webStorageDirectory = Directory('');

  static final _lock = Lock();

  static Future<void> build({
    String? name,
    required Directory storageDirectory,
    HiveCipher? encryptionCipher,
  }) {
    return _lock.synchronized(() async {
      if (_instance != null) return;
      var name0 = name?.toLowerCase() ?? 'hive_storage';
      Box<dynamic> box;
      if (kIsWeb) {
        box = await Hive.openBox<dynamic>(
          name0,
          encryptionCipher: encryptionCipher,
        );
      } else {
        Hive.init(storageDirectory.path);
        box = await Hive.openBox<dynamic>(
          name0,
          encryptionCipher: encryptionCipher,
        );
        await _migrate(name0, storageDirectory, box);
      }

      _instance = HiveStorage._(box);
    });
  }

  static Future<dynamic> _migrate(String name, Directory directory, Box<dynamic> box) async {
    debugPrint('_migrate');
    final file = File('${directory.path}/.$name.json');
    if (file.existsSync()) {
      try {
        final dynamic storageJson = json.decode(await file.readAsString());
        final cache = (storageJson as Map).cast<String, String>();
        for (final key in cache.keys) {
          try {
            final string = cache[key];
            final dynamic object = json.decode(string ?? '');
            await box.put(key, object);
          } catch (_) {}
        }
      } catch (_) {}
      await file.delete();
    }
  }

  @override
  Future<void> put(String key, dynamic value) async {
    if (box.isOpen) {
      return _lock.synchronized(() => box.put(key, value));
    }
  }

  @override
  Future<void> putAll(Map<String, dynamic> entries) async {
    if (box.isOpen) {
      return _lock.synchronized(() => box.putAll(entries));
    }
  }

  @override
  Future<void> delete(String key) async {
    if (box.isOpen) {
      return _lock.synchronized(() => box.delete(key));
    }
  }

  @override
  Future<void> close() async {
    if (box.isOpen) {
      _instance = null;
      return _lock.synchronized(box.close);
    }
  }

  @override
  bool containsKey(String key) => box.containsKey(key);

  @override
  Future<void> deleteAll(Iterable<String> keys) async {
    if (box.isOpen) {
      return _lock.synchronized(() => box.deleteAll(keys));
    }
  }

  @override
  Future<void> flush() async {
    if (box.isOpen) {
      return _lock.synchronized(() => box.flush());
    }
  }

  @override
  bool get isEmpty => box.isEmpty;

  @override
  bool get isNotEmpty => box.isNotEmpty;

  @override
  bool get isOpen => box.isOpen;

  @override
  Iterable<String> get keys => box.keys.cast<String>();

  @override
  int get length => box.length;

  @override
  String get name => box.name;

  @override
  get(String key, {dynamic defaultValue}) => box.get(key, defaultValue: defaultValue);

  @override
  Map<String, dynamic> toMap() => box.toMap().cast<String, dynamic>();

  @override
  Iterable get values => box.values;
}
