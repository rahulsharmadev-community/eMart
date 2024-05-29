part of 'app_routes.dart';

CustomTransitionPage withFadeTran(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (ctx, anim, secAnim, child) {
      return FadeTransition(opacity: anim, child: child);
    },
  );
}

sealed class _AppRouterConfig {
  static GoRouter initialize = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/${AppRoutes.HomeScreen.name}',
      navigatorKey: AppNavigator.rootNavigatorKey,
      observers: [AppNavigatorObserver()],
      routes: _routes);

  static final _routes = [
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
          AppRoutes.HomeScreen.goRoute(pageBuilder: (context, state) {
            return withFadeTran(const HomeScreen());
          }),
          AppRoutes.CategoriesScreen.goRoute(pageBuilder: (context, state) {
            return withFadeTran(CategoriesScreen(
              category: state.uri.queryParameters['search'],
            ));
          }),
          AppRoutes.CartScreen.goRoute(pageBuilder: (context, state) {
            return withFadeTran(const CartScreen());
          }),
          AppRoutes.WishlistScreen.goRoute(pageBuilder: (context, state) {
            return withFadeTran(const WishlistScreen());
          }),
          AppRoutes.ProfileScreen.goRoute(pageBuilder: (context, state) {
            return withFadeTran(const ProfileScreen());
          }),
          AppRoutes.ProductQueryScreen.goRoute(
            builder: (context, state) {
              Set<Query> child = {};
              if (state.extra is Query) child = {state.extra as Query};
              if (state.extra is Iterable) child = (state.extra as Iterable<Query>).toSet();
              return ProductQueryBuilder(child);
            },
          ),
        ]),

    AppRoutes.ProductScreen.goRoute(
      builder: (context, state) => ProductScreen(state.extra as String),
    ),
    AppRoutes.AddressScreen.goRoute(
      builder: (context, state) => const AddressScreen(),
    ),
    AppRoutes.EditAddressScreen.goRoute(
      builder: (context, state) => EditAddressScreen(oldAddressId: state.uri.queryParameters['edit']),
    ),
    AppRoutes.SearchKeywordScreen.goRoute(
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

    AppRoutes.ImagePreviewScreen.goRoute(
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
    AppRoutes.LoadingScreen.goRoute(
      pageBuilder: (context, state) {
        var extra = state.extra != null ? (state.extra as Map<String, dynamic>) : null;
        return NoTransitionPage(child: LoadingScreen(canPop: extra?["canPop"] ?? false));
      },
    ),

    AppRoutes.ErrorScreen.goRoute(
      pageBuilder: (context, state) {
        var extra = (state.extra as Map<String, dynamic>);
        return NoTransitionPage(child: ErrorScreen(canPop: extra["canPop"] ?? false));
      },
    ),
  ];
}

extension on AppRoutes {
  GoRoute goRoute({
    String fid = '',
    Widget Function(BuildContext, GoRouterState)? builder,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    FutureOr<bool> Function(BuildContext, GoRouterState)? onExit,
    List<RouteBase> routes = const <RouteBase>[],
  }) =>
      GoRoute(
        name: name,
        path: '/$name$fid',
        builder: builder,
        redirect: redirect,
        onExit: onExit,
        pageBuilder: pageBuilder,
        parentNavigatorKey: parentNavigatorKey,
        routes: routes,
      );
}
