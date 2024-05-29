// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jars/jars.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/repository.dart';
import 'package:shopping/utility/extensions.dart';

part 'primary_user_event.dart';

typedef PrimaryUserState = BlocState<PrimaryUser>;
typedef PrimaryUserInitialState = BlocStateInitial<PrimaryUser>;
typedef PrimaryUserLoadingState = BlocStateLoading<PrimaryUser>;
typedef PrimaryUserSuccessState = BlocStateSuccess<PrimaryUser>;
typedef PrimaryUserFailureState = BlocStateFailure<PrimaryUser>;

class PrimaryUserBloc extends Bloc<PrimaryUserEvent, PrimaryUserState> {
  final PrimaryUserRepository primaryUserRepository;
  final UserActivityRepository userActivityRepository;
  StreamSubscription? subscription;

  PrimaryUser? get primaryUser =>
      state is BlocStateSuccess ? (state as BlocStateSuccess<PrimaryUser>).data : null;

  PrimaryUserBloc({required String uid})
      : primaryUserRepository = repository.primaryUser(uid),
        userActivityRepository = repository.userActivity(uid),
        super(const PrimaryUserLoadingState()) {
    subscription = primaryUserRepository.getStream.listen((user) async {
      if (user == null) {
        var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
        asyncGuard(() => PrimaryUserRepository.createNewUser(result));
      } else {
        final temp = primaryUser?.userActivity ?? await userActivityRepository.get() ?? const UserActivity();
        emit(PrimaryUserSuccessState(PrimaryUser(user: user, userActivity: temp)));
      }
    });

    on<PrimaryUserDispose>((event, emit) => emit(const PrimaryUserLoadingState()));

    on<AddVisitedProductEvent>((event, emit) async {
      if (state.isSuccess) {
        await userActivityRepository.addVisitedProduct(event.productId).then((value) {
          emit(PrimaryUserSuccessState(primaryUser!.copyWith.userActivity(value)));
        });
      }
    });

    on<AddSuggestionKeywordsEvent>((event, emit) async {
      if (state.isSuccess) {
        await userActivityRepository.addSuggestionKeywords(event.keywords).then((value) {
          emit(PrimaryUserSuccessState(primaryUser!.copyWith.userActivity(value)));
        });
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      if (state.isSuccess) {
        final oldValue = primaryUser!.user;
        final newValue = event.consumer(oldValue);
        if (oldValue == newValue) return;
        await primaryUserRepository.update(newValue: newValue, oldValue: oldValue);
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
