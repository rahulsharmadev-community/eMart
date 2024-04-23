// ignore_for_file: use_build_context_synchronously, camel_case_types
import 'dart:ui' as ui;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/firebase_service.dart';
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
  const eMartShoppingAppRunner({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = FirebaseService.eMartConsumer.instanceOfAuth;
    var cubit = eMartShoppingCubit(auth, Connectivity())..listenToAuthAndConnectivity();
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<eMartShoppingCubit, eMartShoppingState>(
        builder: (context, state) {
          switch (state) {
            case AuthenticatedState _:
              return eMartAppBuilder(uid: state.uid);
            case UnauthenticatedState _:
              return AuthenticationScreen(auth: auth);
            case ConnectionErrorState _:
              return const ErrorScreen(materialAppWraper: true, msg: 'No internet connection.');
            default:
              return const LoadingScreen(materialAppWraper: true);
          }
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => ProductRepository(api: ProductsApi(), cache: ProductsCache())),
        RepositoryProvider(
            create: (context) => KeywordsRepository(api: KeywordsApi(), cache: KeywordsCache())),
        RepositoryProvider(
            create: (context) => CategoriesRepository(api: CategoriesApi(), cache: CategoriesCache())),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<PrimaryUserBloc>(
          create: (context) => PrimaryUserBloc(PrimaryUserApi(uid)),
          lazy: false,
        ),
        BlocProvider<AppMetaDataBloc>(
          create: (context) => AppMetaDataBloc(AppMetaDataRepository(api: AppMetaDataApi())),
          lazy: false,
        ),
      ], child: bodyBuilder(context)),
    );
  }

  Widget bodyBuilder(BuildContext context) {
    var theme = AppThemes.SANDRED.appTheme;
    return BlocBuilder<PrimaryUserBloc, BlocState>(
      builder: (context, state) {
        switch (state) {
          case BlocStateSuccess _:
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
          case BlocStateFailure _:
            return ErrorScreen(materialAppWraper: true, msg: state.message);
          default:
            return const LoadingScreen(materialAppWraper: true);
        }
      },
    );
  }
}
