import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/utility/bloc_state.dart';

class AppMetaDataBloc extends Cubit<BlocState<AppMetaData>> {
  final AppMetaDataRepository repository;

  StreamSubscription? subscription;
  AppMetaDataBloc(this.repository) : super(const BlocStateLoading()) {
    _inital();
  }
  void _inital() {
    subscription = repository.stream.listen((event) {
      print(event);
      emit(event != null ? BlocStateSuccess(event) : const BlocStateFailure('Data not exist'));
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
