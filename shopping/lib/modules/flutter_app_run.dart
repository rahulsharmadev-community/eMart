// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/screens/auth_screen/auth_screen.dart';
import 'package:shopping/modules/screens/other_screens/error_screen.dart';
import 'package:shopping/modules/screens/other_screens/loading_screen.dart';
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
      builder: (context, snap) {
        return snap.data == null && snap.data == null
            ? AuthenticationScreen(auth: auth)
            : eMartAppBuilder(uid: snap.data!.uid);
      },
    );
  }
}

class eMartAppBuilder extends StatelessWidget {
  final String uid;

  const eMartAppBuilder({super.key, required this.uid});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AppMetaDataRepository(api: AppMetaDataApi(), cache: AppMetaDataCache())),
        RepositoryProvider(
            create: (context) => ProductRepository(api: ProductsApi(), cache: ProductsCache())),
        RepositoryProvider(
            create: (context) => KeywordsRepository(api: KeywordsApi(), cache: KeywordsCache())),
        RepositoryProvider(
            create: (context) => AppMetaDataRepository(api: AppMetaDataApi(), cache: AppMetaDataCache())),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<PrimaryUserBloc>(
          create: (context) => PrimaryUserBloc(PrimaryUserApi(uid))..add(PrimaryUserInitialize()),
          lazy: false,
        ),
      ], child: const _MaterialAppBuilder()),
    );
  }
}

class _MaterialAppBuilder extends StatelessWidget {
  const _MaterialAppBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryUserBloc, PrimaryUserState>(
      builder: (context, state) {
        switch (state) {
          case PrimaryUserLoaded _:
            return MaterialApp.router(
              title: 'eMart Shopping',
              routerConfig: AppRoutes.config,
              scaffoldMessengerKey: AppNavigator.messengerKey,
              debugShowCheckedModeBanner: kDebugMode,
            );
          case PrimaryUserError _:
            return ErrorScreen(materialAppWraper: true, msg: state.errorMsg);
          default:
            return const LoadingScreen(materialAppWraper: true);
        }
      },
    );
  }
}