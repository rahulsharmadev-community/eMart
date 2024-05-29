// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';

typedef AuthenticationState = BlocState<String>;
typedef AuthenticatedState = BlocStateSuccess<String>;
typedef UnauthenticatedState = BlocStateInitial<String>;
typedef AuthenticatingState = BlocStateLoading<String>;
typedef AuthenticationFailureState = BlocStateFailure<String>;

class eMartShoppingCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth auth;
  StreamSubscription<User?>? _authSubscription;
  StreamSubscription<bool>? _connectivitySubscription;
  eMartShoppingCubit(this.auth) : super(const AuthenticatingState()) {
    _listenToAuthAndConnectivity();
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    _connectivitySubscription?.cancel();
    super.close();
  }

  void _listenToAuthAndConnectivity() {
    _authSubscription = auth.authStateChanges().listen((user) {
      emit(
        user != null ? AuthenticatedState(user.uid) : UnauthenticatedState(),
      );
    }, onError: (e) {
      emit(AuthenticationFailureState(e.toString()));
    });
  }
}
