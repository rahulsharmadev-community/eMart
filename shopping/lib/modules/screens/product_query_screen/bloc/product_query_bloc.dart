import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';

part 'product_query_event.dart';
part 'product_query_state.dart';

class ProductQueryBloc extends Bloc<ProductQueryEvent, ProductQueryState> {
  final ProductRepository repository;
  ProductQueryBloc(this.repository) : super(ProductQueryLoading()) {
    on<ProductQueryInitiateEvent>((event, emit) async {
      var temp = await repository.getByQuery(event.queryParameters);
      emit(ProductQuerySuccess(temp));
    });
  }
}
