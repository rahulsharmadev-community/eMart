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
        return const eMartBusinessDashboard();
      },
      routes: [],
    ),
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
