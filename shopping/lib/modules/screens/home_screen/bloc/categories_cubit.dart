import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:jars/jars.dart';

class CategoriesBloc extends Cubit<BlocState<List<Categories>>> {
  final AppMetaDataRepository repository;
  CategoriesBloc(this.repository) : super(const BlocStateLoading()) {
    _inital();
  }
  void _inital() {
    repository.stream.listen((event) {
      emit(BlocStateSuccess(event?.categories ?? []));
    });
  }
}
