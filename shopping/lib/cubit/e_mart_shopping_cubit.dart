import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';

part 'e_mart_shopping_state.dart';

// ignore: camel_case_types
class eMartShoppingCubit extends Cubit<eMartShoppingState> {
  final FirebaseAuth auth;
  final Connectivity connectivity;
  StreamSubscription<User?>? _authSubscription;
  StreamSubscription<bool>? _connectivitySubscription;
  eMartShoppingCubit(this.auth, this.connectivity) : super(eMartShoppingLoading());

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    _connectivitySubscription?.cancel();
    super.close();
  }

  void listenToAuthAndConnectivity() {
    _authSubscription = auth.authStateChanges().listen((user) => emit(
          user != null ? AuthenticatedState(uid: user.uid) : UnauthenticatedState(),
        ));
    if (PlatformQuery.isMobileorTablet) {
      _connectivitySubscription = connectivity.onConnectivityChanged
          .map((event) => !event.anyOf([ConnectivityResult.mobile, ConnectivityResult.wifi]))
          .listen((event) {
        if (event) emit(ConnectionErrorState());
      });
    }
  }
}

extension on List<Object> {
  bool anyOf(List<Object> ls) {
    for (var e in ls) {
      if (contains(e)) return true;
    }
    return false;
  }
}
