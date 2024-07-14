import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars_core.dart';
import 'package:jars/logger.dart';
import '../path_cubit/path_cubit.dart';
import 'package:shared_repositories/b.repositories.dart';

part 'content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  final PathCubit pathCubit;
  final Future<SelectedCategories> Function(List<String>) onPathChanged;
  ContentCubit(this.pathCubit, this.onPathChanged) : super(ContentLoading()) {
    _emitState(pathCubit.state);

    pathCubit.stream.listen(_emitState);
  }

  _emitState(PathState path) async {
    log.i('ContentCubit : $path');

    // Before fetching the data
    emit(ContentLoading());

    await asyncGuard(() async {
      // Fetch the data
      var values = await onPathChanged(path);

      // After fetching the data
      emit(ContentLoaded(
        path: path,
        selectable: values.unExpendable,
        expendable: values.expendable,
      ));
    }, onError: (e) => emit(ContentError(e)));
  }
}
