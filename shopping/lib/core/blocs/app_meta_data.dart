import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:jars/jars.dart';
import 'package:shopping/core/repository.dart';

class AppMetaDataBloc extends Cubit<BlocState<AppMetaData>> {
  final AppMetaDataRepository appMetaDataRepository;
  StreamSubscription? subscription;

  AppMetaData? get appMetaData =>
      state is BlocStateSuccess ? (state as BlocStateSuccess<AppMetaData>).data : null;

  AppMetaDataBloc()
      : appMetaDataRepository = repository.appMetaData,
        super(const BlocStateLoading()) {
    _inital();
  }
  void _inital() {
    subscription = appMetaDataRepository.stream.listen((event) {
      emit(event != null ? BlocStateSuccess(event) : const BlocStateFailure('Data not exist'));
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
