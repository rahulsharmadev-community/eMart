import 'package:bloc/bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/utility/bloc_state.dart';

class ProductQueryBloc extends Cubit<BlocState<List<Product>>> {
  final ProductRepository repository;
  ProductQueryBloc(this.repository) : super(const BlocStateLoading());

  Future<void> fetch(Set<Query> queries) async {
    print('ProductQueryBloc :fetch');
    emit(const BlocStateLoading());
    try {
      var result = await repository.getByQuery(queries);
      print(result.length);
      emit(BlocStateSuccess(result));
    } catch (e) {
      emit(BlocStateFailure(e.toString()));
    }
  }
}
