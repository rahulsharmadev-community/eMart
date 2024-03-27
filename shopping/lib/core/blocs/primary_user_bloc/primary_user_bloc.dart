import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
import 'package:shopping/utility/extensions.dart';

part 'primary_user_event.dart';
part 'primary_user_state.dart';

class PrimaryUserBloc extends HydratedBloc<PrimaryUserEvent, PrimaryUserState> {
  final PrimaryUserApi api;

  Consumer? get primaryUser => state is PrimaryUserLoaded ? (state as PrimaryUserLoaded).user : null;

  PrimaryUserBloc(
    this.api,
  ) : super(PrimaryUserLoading()) {
    on<PrimaryUserInitialize>(_initialize);
    on<PrimaryUserDispose>((event, emit) => emit(PrimaryUserLoading()));
    on<UpdateEvent>((event, emit) {
      if (state is PrimaryUserLoaded) {
        final temp = primaryUser!;
        emit(PrimaryUserLoaded(event.consumer));
        api.update(event.consumer, temp).catchError((_) {
          emit(PrimaryUserLoaded(temp));
        });
      }
    });
  }

  FutureOr<void> _initialize(PrimaryUserEvent event, Emitter<PrimaryUserState> emit) async {
    try {
      var value = await api.get();
      if (value == null) {
        var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
        await PrimaryUserApi.createNewUser(result);
        emit(PrimaryUserLoaded(result));
      } else {
        emit(PrimaryUserLoaded(value));
      }
    } catch (e) {
      emit(PrimaryUserError("$e"));
    }
  }

  @override
  PrimaryUserState? fromJson(Map<String, dynamic> json) => PrimaryUserState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(PrimaryUserState state) => state.toJson();
}
