part of 'app_routes.dart';

CustomTransitionPage withFadeTran(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (ctx, anim, secAnim, child) {
      return FadeTransition(opacity: anim, child: child);
    },
  );
}

class _AppRouter {
  _AppRouter.internal();

  GoRouter get run => GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/${AppRoutes.HomeScreen.name}',
      navigatorKey: AppNavigator.rootNavigatorKey,
      observers: [AppNavigatorObserver()],
      routes: _routes);

  final _routes = [
    ShellRoute(
        navigatorKey: AppNavigator.shellNavigatorKey,
        builder: (context, state, child) {
          return BlocBuilder<AppMetaDataBloc, BlocState>(
            builder: (context, state) {
              return PlatformQuery.isMobileorTablet
                  ? eMartMobileDashBoard(child: child)
                  : eMartWebDashBoard(child: child);
            },
          );
        },
        routes: [
          GoRoute(
              path: '/${AppRoutes.HomeScreen.name}',
              name: AppRoutes.HomeScreen.name,
              pageBuilder: (context, state) => withFadeTran(const HomeScreen())),
          GoRoute(
              path: '/${AppRoutes.CategoriesScreen.name}',
              name: AppRoutes.CategoriesScreen.name,
              pageBuilder: (context, state) {
                return withFadeTran(CategoriesScreen(
                  category: state.uri.queryParameters['search'],
                ));
              }),
          GoRoute(
              path: '/${AppRoutes.CartScreen.name}',
              name: AppRoutes.CartScreen.name,
              pageBuilder: (context, state) => withFadeTran(const CartScreen())),
          GoRoute(
              path: '/${AppRoutes.WishlistScreen.name}',
              name: AppRoutes.WishlistScreen.name,
              pageBuilder: (context, state) => withFadeTran(const WishlistScreen())),
          GoRoute(
              path: '/${AppRoutes.ProfileScreen.name}',
              name: AppRoutes.ProfileScreen.name,
              pageBuilder: (context, state) => withFadeTran(const ProfileScreen())),
          GoRoute(
            name: AppRoutes.ProductQueryScreen.name,
            path: '/${AppRoutes.ProductQueryScreen.name}',
            builder: (context, state) {
              Set<Query> child = {};
              if (state.extra is Query) child = {state.extra as Query};
              if (state.extra is Iterable) child = (state.extra as Iterable<Query>).toSet();
              return ProductQueryBuilder(child);
            },
          ),
        ]),

    GoRoute(
      name: AppRoutes.ProductScreen.name,
      path: '/${AppRoutes.ProductScreen.name}',
      builder: (context, state) {
        return ProductScreen(state.extra as String);
      },
    ),
    GoRoute(
      name: AppRoutes.SearchKeywordScreen.name,
      path: '/${AppRoutes.SearchKeywordScreen.name}',
      builder: (context, state) {
        var extra = state.extra as JSON?;
        return SearchKeywordScreen(
          initalText: extra?['initalText'],
          hintText: extra?['hintText'],
          whenEmpty: extra?['whenEmpty'],
          whenNotFound: extra?['whenNotFound'],
        );
      },
    ),

    GoRoute(
      name: AppRoutes.ImagePreviewScreen.name,
      path: '/${AppRoutes.ImagePreviewScreen.name}',
      builder: (context, state) {
        var extra = state.extra as Map<String, dynamic>;
        return ImagePreviewScreen(
          title: extra['title'],
          urls: extra['urls'],
          onDone: extra['onDone'],
        );
      },
    ),

    // GoRoute(
    //   name: AppRoutes.CameraScreen.name,
    //   path: AppRoutes.CameraScreen.name,
    //   builder: (context, state) {
    //     var extra = state.extra as Map;
    //     return CameraScreen(
    //       onPreview: extra['onPreview'],
    //       forceOnlyOneClick: extra['forceOnlyOneClick'],
    //       onPop: AppNavigator.pop,
    //     );
    //   },
    // ),
    // GoRoute(
    //     path: AppRoutes.SettingsScreen.name,
    //     name: AppRoutes.SettingsScreen.name,
    //     builder: (context, state) => const SettingsScreen(),
    //     routes: [
    //       GoRoute(
    //         path: AppRoutes.HelpCenterScreen.name,
    //         name: AppRoutes.HelpCenterScreen.name,
    //         builder: (context, state) => const HelpCenterScreen(),
    //       ),
    //     ]),

    GoRoute(
      name: AppRoutes.LoadingScreen.name,
      path: '/${AppRoutes.LoadingScreen.name}',
      pageBuilder: (context, state) {
        var extra = state.extra != null ? (state.extra as Map<String, dynamic>) : null;
        return NoTransitionPage(child: LoadingScreen(canPop: extra?["canPop"] ?? false));
      },
    ),
    GoRoute(
      name: AppRoutes.ErrorScreen.name,
      path: '/${AppRoutes.ErrorScreen.name}',
      pageBuilder: (context, state) {
        var extra = (state.extra as Map<String, dynamic>);

        return NoTransitionPage(child: ErrorScreen(canPop: extra["canPop"] ?? false));
      },
    ),
  ];
}
