import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';

extension PrimaryUserBlocExt on BuildContext {
  PrimaryUser get primaryUser => read<PrimaryUserBloc>().primaryUser!;

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
      name: PersonName.fromString(displayName ?? email?.split('@').first ?? 'Unknown'),
      devices: const [],
      fCMid: "",
      email: email,
      phoneNumber: phoneNumber,
      profileImg: photoURL,
    );
  }
}
