import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';

class CartCubit extends Cubit<BlocState<List<Product>>> {
  final ProductRepository repository;
  CartCubit(this.repository) : super(const BlocStateLoading());

  void fetch(List<String> productIds) async {
    try {
      emit(const BlocStateLoading());
      var result = await repository.getAll(productIds);
      emit(BlocStateSuccess(result ?? []));
    } catch (error) {
      emit(BlocStateFailure(error.toString()));
    }
  }
}
