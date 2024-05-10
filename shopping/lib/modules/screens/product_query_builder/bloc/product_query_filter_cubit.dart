import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/screens/product_query_builder/bloc/product_query_cubit.dart';

class QueryFilter {
  final Set<Query> pending;
  final Set<Query> complete;

  QueryFilter({this.pending = const {}, this.complete = const {}});

  QueryFilter copyWith({Set<Query>? pending, Set<Query>? complete}) => QueryFilter(
        pending: pending ?? this.pending,
        complete: complete ?? this.complete,
      );

  @override
  String toString() => "QueryFilter(pending: $pending, complete: $complete)";
}

class ProductQueryFilterCubit extends Cubit<QueryFilter> {
  final ProductRepository repository;
  final ProductsCubit productsCubit;
  ProductQueryFilterCubit(this.repository, this.productsCubit, {Set<Query>? inital}) : super(QueryFilter()) {
    if (inital != null) add(inital.toList());
  }

  List<Query> get applyedFilter => state.complete.toList();
  List<Query> get pendingFilter => state.pending.toList();

  bool isPending(Type type) => state.pending.any((e) => e.runtimeType == type);
  bool isApplyed(Type type) => state.complete.any((e) => e.runtimeType == type);

  removeWhereType(Type type) {
    emit(state.copyWith(complete: state.complete.where((e) => e.runtimeType != type).toSet()));
  }

  add(List<Query> queries) {
    if (queries.isEmpty) return; // No need to process if there are no queries

    final pending = {...state.pending}..addAll(queries);
    emit(state.copyWith(pending: pending)); // Update state with added pending queries

    _fetch().then((_) {
      emit(state.copyWith(
          pending: {}, complete: {...state.complete}..addAll(pending))); // All pending requests now completed
    }).catchError((_) {
      emit(state.copyWith(pending: {})); // Drop all pending requests
    });
  }

  removeAll(List<Query> queries) => emit(state.copyWith(pending: {}, complete: {}));

// Fetch data based on queries
  Future<void> _fetch() async {
    try {
      // query should hold an existing filter and upcoming pending filter
      var result = await repository.getByQuery({...state.complete, ...state.pending});
      print(result);
      productsCubit.emit(BlocStateSuccess(result));
      // ignore: empty_catches
    } catch (e) {
      print(e);
    }
  }
}
