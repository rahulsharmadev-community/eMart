// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jars/jars.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
import 'package:shopping/utility/extensions.dart';

part 'primary_user_event.dart';
// part 'primary_user_state.dart';

class PrimaryUserBloc extends Bloc<PrimaryUserEvent, BlocState<Consumer>> {
  final PrimaryUserApi api;
  StreamSubscription? subscription;

  Consumer? get primaryUser => state is BlocStateSuccess ? (state as BlocStateSuccess<Consumer>).data : null;

  PrimaryUserBloc(
    this.api,
  ) : super(const BlocStateLoading()) {
    subscription = api.getStream.listen((event) {
      if (event == null) {
        var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
        asyncGuard(() => PrimaryUserApi.createNewUser(result));
      } else {
        emit(BlocStateSuccess<Consumer>(event));
      }
    });

    on<PrimaryUserDispose>((event, emit) => emit(const BlocStateLoading()));
    on<UpdateEvent>((event, emit) {
      if (state is BlocStateSuccess) {
        final oldValue = primaryUser!;
        final newValue = event.consumer(oldValue);
        if (oldValue == newValue) return;

        emit(BlocStateSuccess(newValue));
        api.update(newValue).catchError((_) {
          emit(BlocStateSuccess(oldValue));
        });
      }
    });
  }

  // void _initialize(PrimaryUserEvent event, Emitter<BlocState<Consumer>> emit) {
  //   subscription = api.getStream.listen((event) {
  //     if (event == null) {
  //       var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
  //       PrimaryUserApi.createNewUser(result);
  //     } else {
  //       emit(BlocStateSuccess<Consumer>(event));
  //     }
  //   });
  // }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
