import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/utility/bloc_state.dart';

class CategoriesBloc extends Cubit<BlocState<List<Categories>>> {
  final AppMetaDataRepository repository;
  CategoriesBloc(this.repository) : super(const BlocStateLoading()) {
    _inital();
  }
  void _inital() async {
    try {
      var n = await repository.get();
      emit(BlocStateSuccess(n?.categories ?? []));
    } catch (e) {
      emit(BlocStateFailure(e.toString()));
    }
  }
}
