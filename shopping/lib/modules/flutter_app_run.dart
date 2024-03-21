// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/screens/auth_screen/auth_screen.dart';
import 'package:shopping/utility/navigation/app_navigator.dart';
import 'package:shopping/utility/routes/app_routes.dart';

class eMartShoppingAppRunner extends StatelessWidget {
  final JSON deviceInfo;
  const eMartShoppingAppRunner(
    this.deviceInfo, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var auth = FirebaseService.eMartConsumer.instanceOfAuth;
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return eMartAppHome(uid: snapshot.data!.uid);
        } else {
          return AuthenticationScreen(auth: auth);
        }
      },
    );
  }
}

class eMartAppHome extends StatelessWidget {
  final String uid;
  const eMartAppHome({super.key, required this.uid});
  @override
  Widget build(BuildContext context) {
    // Rebuild only when the selected parameter changes.
    // var themeMode =
    //     context.select<PrimaryUserBloc, ThemeMode>((state) => state.primaryUser!.settings.themeMode);

    // var theme = context.select<PrimaryUserBloc, AppThemes>((state) {
    //   return state.primaryUser!.settings.theme;
    // }).appTheme;

    final userApi = PrimaryUserApi(uid);

    return MultiBlocProvider(
      providers: [
        BlocProvider<PrimaryUserBloc>(
          create: (context) => PrimaryUserBloc(userApi),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        // theme: theme.light.themeData,
        // darkTheme: theme.dark.themeData,
        // themeMode: themeMode,
        routerConfig: AppRoutes.config,
        scaffoldMessengerKey: AppNavigator.messengerKey,
        debugShowCheckedModeBanner: kDebugMode,
      ),
    );
  }
}
