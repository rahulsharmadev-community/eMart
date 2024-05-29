import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/repository.dart';

typedef ProductState = BlocState<List<Product>>;
typedef ProductLoadingState = BlocStateLoading<List<Product>>;
typedef ProductLoadedState = BlocStateSuccess<List<Product>>;
typedef ProductErrorState = BlocStateFailure<List<Product>>;

class ProductsCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductsCubit()
      : productRepository = repository.product,
        super(const ProductLoadingState());

  Future<void> fetchByIds(List<String> ids, {bool disableCache = false}) async {
    try {
      var response = await productRepository.getAll(ids, disableCache: disableCache);
      if (response != null) emit(ProductLoadedState(response));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  Future<void> fetchByQuery(Set<Query> queries, {bool disableCache = false}) async {
    try {
      var response = await productRepository.getByQuery(queries);
      emit(ProductLoadedState(response));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
}
