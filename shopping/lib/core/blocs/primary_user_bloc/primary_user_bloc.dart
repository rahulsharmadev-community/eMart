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

class PrimaryUserBloc extends Bloc<PrimaryUserEvent, BlocState<PrimaryUser>> {
  final PrimaryUserApi api;
  final UserActivityRepository userActivityRepository;
  final ProductRepository productRepository;
  StreamSubscription? subscription;

  PrimaryUser? get primaryUser =>
      state is BlocStateSuccess ? (state as BlocStateSuccess<PrimaryUser>).data : null;

  PrimaryUserBloc({
    required this.api,
    required this.userActivityRepository,
    required this.productRepository,
  }) : super(const BlocStateLoading()) {
    subscription = api.getStream.listen((event) async {
      if (event == null) {
        var result = FirebaseService.eMartConsumer.instanceOfAuth.currentUser!.createConsumer;
        asyncGuard(() => PrimaryUserApi.createNewUser(result));
      } else {
        final temp = primaryUser?.userActivity ?? await userActivityRepository.get() ?? const UserActivity();
        emit(BlocStateSuccess<PrimaryUser>(PrimaryUser(user: event, userActivity: temp)));
      }
    });

    on<PrimaryUserDispose>((event, emit) => emit(const BlocStateLoading()));



    on<AddVisitedProductEvent>((event, emit) async {
      if (state is BlocStateSuccess) {
        await userActivityRepository.addVisitedProduct(event.productId).then((value) {
          emit(BlocStateSuccess(primaryUser!.copyWith.userActivity(value)));
        });
      }
    });

    on<AddSuggestionKeywordsEvent>((event, emit) async {
      if (state is BlocStateSuccess) {
        await userActivityRepository.addSuggestionKeywords(event.keywords).then((value) {
          emit(BlocStateSuccess(primaryUser!.copyWith.userActivity(value)));
        });
      }
    });

    on<UpdateUserEvent>((event, emit) {
      if (state is BlocStateSuccess) {
        final oldValue = primaryUser!.user;
        final newValue = event.consumer(oldValue);
        if (oldValue == newValue) return;
        emit(BlocStateSuccess(primaryUser!.copyWith(user: newValue)));
        api
            .update(newValue)
            .catchError((_) => emit(BlocStateSuccess(primaryUser!.copyWith(user: oldValue), message: '$_')));
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
