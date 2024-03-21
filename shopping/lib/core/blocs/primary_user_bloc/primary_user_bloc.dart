import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';

part 'primary_user_event.dart';
part 'primary_user_state.dart';

class PrimaryUserBloc extends HydratedBloc<PrimaryUserEvent, PrimaryUserState> {
  final PrimaryUserApi api;

  Consumer? get primaryUser => state is PrimaryUserLoaded ? (state as PrimaryUserLoaded).user : null;

  PrimaryUserBloc(
    this.api,
  ) : super(PrimaryUserLoading()) {
    // if (state is PrimaryUserLoading) {

    //   userApi.get().then((value) {
    //     if (value == null) {
    //       var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
    //       PrimaryUserApi.createNewUser(result).then((v) => emit(PrimaryUserLoaded(result)));
    //     } else {
    //       emit(PrimaryUserLoaded(value));
    //     }
    //   });
    // }
    print('Run');

    on<PrimaryUserInitialize>((event, emit) => emit(PrimaryUserLoaded(event.user)));
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

  @override
  PrimaryUserState? fromJson(Map<String, dynamic> json) => PrimaryUserState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(PrimaryUserState state) => state.toJson();
}
