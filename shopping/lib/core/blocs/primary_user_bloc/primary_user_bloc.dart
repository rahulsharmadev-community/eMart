import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
import 'package:shopping/utility/bloc_state.dart';
import 'package:shopping/utility/extensions.dart';

part 'primary_user_event.dart';
part 'primary_user_state.dart';

class PrimaryUserBloc extends Bloc<PrimaryUserEvent, BlocState<Consumer>> {
  final PrimaryUserApi api;
  StreamSubscription? subscription;

  Consumer? get primaryUser => state is PrimaryUserLoaded ? (state as PrimaryUserLoaded).user : null;

  PrimaryUserBloc(
    this.api,
  ) : super(const BlocStateLoading()) {
    on<PrimaryUserInitialize>(_initialize);
    on<PrimaryUserDispose>((event, emit) => emit(const BlocStateLoading()));
    on<UpdateEvent>((event, emit) {
      if (state is PrimaryUserLoaded) {
        final temp = primaryUser!;
        emit(BlocStateSuccess(event.consumer));
        api.update(event.consumer, temp).catchError((_) {
          emit(BlocStateSuccess(temp));
        });
      }
    });
  }

  FutureOr<void> _initialize(PrimaryUserEvent event, Emitter<BlocState> emit) async {
    subscription = api.getStream.listen((event) {
      if (event == null) {
        var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
        PrimaryUserApi.createNewUser(result);
      } else {
        emit(BlocStateSuccess(event));
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
