import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';

extension PrimaryUserBlocExt on BuildContext {
  Consumer get primaryUser => read<PrimaryUserBloc>().primaryUser!;

  // AppThemeData get appTheme {
  //   var settings = primaryUser.settings;
  //   return Theme.of(this).brightness.index == 0
  //       ? settings.theme.appTheme.dark
  //       : settings.theme.appTheme.light;
  // }

  // AppDecoration get decoration => appTheme.decoration;
}

extension UserExt on User {
  Consumer get createConsumer {
    return Consumer(
      uid: uid,
      name: PersonName(firstName: displayName ?? "Unknown"),
      devices: [],
      fCMid: "",
      email: email,
      phoneNumber: phoneNumber,
      profileImg: photoURL,
    );
  }
}
