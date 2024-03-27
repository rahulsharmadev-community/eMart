// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/credentials.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/screens/auth_screen/auth_screen.dart';
import 'package:shopping/core/blocs/bloc/categories_cubit.dart';
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
            : eMartAppHome(uid: snap.data!.uid);
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
      ], child: const _BuilderBody()),
    );
  }
}

class _BuilderBody extends StatelessWidget {
  const _BuilderBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryUserBloc, PrimaryUserState>(
      builder: (context, state) {
        if (state is PrimaryUserLoaded) {
          return MaterialApp.router(
            // theme: theme.light.themeData,
            // darkTheme: theme.dark.themeData,
            // themeMode: themeMode,
            routerConfig: AppRoutes.config,
            scaffoldMessengerKey: AppNavigator.messengerKey,
            debugShowCheckedModeBanner: kDebugMode,
          );
        } else {
          return const LoadingScreen(materialAppWraper: true);
        }
      },
    );
  }
}
