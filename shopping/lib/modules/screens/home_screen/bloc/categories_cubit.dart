import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:jars/jars.dart';
import 'package:shopping/core/repository.dart';

class CategoriesBloc extends Cubit<BlocState<List<Categories>>> {
  final AppMetaDataRepository appMetaDataRepository;
  CategoriesBloc()
      : appMetaDataRepository = repository.appMetaData,
        super(const BlocStateLoading()) {
    _inital();
  }
  void _inital() {
    appMetaDataRepository.stream.listen((event) {
      emit(BlocStateSuccess(event?.categories ?? []));
    });
  }
}
