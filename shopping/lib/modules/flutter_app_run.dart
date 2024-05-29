// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shopping/core/blocs/app_meta_data.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/core/cubit/e_mart_shopping_cubit.dart';
import 'package:shopping/modules/screens/auth_screen/auth_screen.dart';
import 'package:shopping/modules/screens/other_screens/error_screen.dart';
import 'package:shopping/modules/screens/other_screens/loading_screen.dart';
import 'package:shopping/utility/navigation/app_navigator.dart';
import 'package:shopping/utility/routes/app_routes.dart';
import 'package:shopping/utility/theme/app_theme.dart';

class eMartShoppingAppRunner extends StatelessWidget {
  final FirebaseAuth auth;
  const eMartShoppingAppRunner({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eMartShoppingCubit(auth),
      lazy: false,
      child: BlocBuilder<eMartShoppingCubit, AuthenticationState>(
        builder: (context, state) {
          return state.on(
              onInitial: AuthenticationScreen(auth: auth),
              onSuccess: (state) => eMartAppBuilder(uid: state.data),
              onFailure: (state) => ErrorScreen(materialAppWraper: true, title: state.message),
              onLoading: (_) => const LoadingScreen(materialAppWraper: true));
        },
      ),
    );
  }
}

class eMartAppBuilder extends StatelessWidget {
  final String uid;

  const eMartAppBuilder({super.key, required this.uid});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PrimaryUserBloc>(
        create: (context) => PrimaryUserBloc(uid: uid),
        lazy: false,
      ),
      BlocProvider<AppMetaDataBloc>(
        create: (context) => AppMetaDataBloc(),
        lazy: false,
      ),
    ], child: bodyBuilder(context));
  }

  Widget bodyBuilder(BuildContext context) {
    var theme = AppThemes.SANDRED.appTheme;
    return BlocBuilder<PrimaryUserBloc, PrimaryUserState>(
      builder: (context, state) {
        return state.on(
            onInitial: const LoadingScreen(materialAppWraper: true),
            onFailure: (state) => ErrorScreen(materialAppWraper: true, title: state.message),
            onSuccess: (state) {
              const msb = MaterialScrollBehavior();
              return MaterialApp.router(
                scrollBehavior: !PlatformQuery.isMobileorTablet
                    ? msb.copyWith(dragDevices: {ui.PointerDeviceKind.mouse})
                    : msb,
                theme: theme.themeData,
                title: 'eMart Shopping',
                routerConfig: AppRoutes.config,
                scaffoldMessengerKey: AppNavigator.messengerKey,
                debugShowCheckedModeBanner: kDebugMode,
              );
            });
      },
    );
  }
}
