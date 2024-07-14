import 'dart:async';
import 'dart:convert';
import 'package:jars/jars_core.dart';
import 'package:jars/logger.dart';
import 'package:shared/apis.dart';
import '/src/utils/error_handler.dart';
import 'package:http/http.dart' as http;
import 'package:hive_cache/hive_cache.dart';
part 'categories_api.dart';
part 'categories_cache.dart';

typedef SelectedCategories = ({List<String> expendable, List<String> unExpendable});

extension on SelectedCategories {
  SelectedCategories add({List<String>? expendable, List<String>? unExpendable}) {
    return (
      expendable: [...this.expendable, ...?expendable],
      unExpendable: [...this.unExpendable, ...?unExpendable]
    );
  }
}

class CategoriesRepository {
  final CategoriesApi api;
  final CategoriesCache cache;

  CategoriesRepository()
      : api = CategoriesApi(),
        cache = CategoriesCache();

  Future<SelectedCategories> getByPath(List<String> path) async {
    log.i('getByPath');
    JSON? map = cache.get(); // get the cache
    map ??= await api.get(); // get the data from the api if cache is empty

    if (map == null) {
      throw Exception("Failed to load categories");
    }

    const openKey = '__open__';
    SelectedCategories result = (
      expendable: map.keys.toList()..remove(openKey),
      unExpendable: map[openKey] ?? [],
    );

    for (var key in path) {
      var value = map![key]!;
      if (value is Map) {
        map = Map.from(value);
        result = map.containsKey(openKey)
            ? result = result.add(expendable: List.from(map[openKey]))
            : result = result.add(unExpendable: List.from(map.keys));
      }
      if (value is List) {
        result = result.add(expendable: List.from(map[openKey]));
      }
    }

    return result;
  }
}
