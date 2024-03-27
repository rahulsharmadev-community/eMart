import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'categories_state.dart';

class CategoriesBloc extends Cubit<CategoriesState> {
  final AppMetaDataRepository repository;
  CategoriesBloc(this.repository) : super(CategoriesLoading()) {
    _inital();
  }
  void _inital() async {
    try {
      var n = await repository.get();
      emit(CategoriesLoaded(n?.categories ?? []));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
