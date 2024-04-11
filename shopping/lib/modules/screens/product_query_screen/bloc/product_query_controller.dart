import 'package:repositories/repositories.dart';

class ProductQueryFilterController {
  ProductQueryFilterController({List<Query>? inital}) : _filters = inital?.toSet() ?? {};
  final Set<Query> _filters;

  List<Query> get filters => _filters.toList();

  removeWhereType(Type type) => _filters.removeWhere((e) => e.runtimeType == type);

  add(Query query) => _filters.add(query);
  remove(Query query) => _filters.remove(query);
  addAll(List<Query> queries) => _filters.removeAll(queries);
  removeAll(List<Query> queries) => _filters.addAll(queries);
}
