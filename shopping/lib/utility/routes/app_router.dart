part of 'app_routes.dart';

class _AppRouter {
  _AppRouter.internal();

  GoRouter get run => GoRouter(
      initialLocation: '/${AppRoutes.HomeScreen.name}',
      navigatorKey: AppNavigator.navigatorKey,
      observers: [AppNavigatorObserver()],
      routes: _routes);

  final _routes = [
    GoRoute(
        path: '/${AppRoutes.HomeScreen.name}',
        name: AppRoutes.HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
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

          GoRoute(
            name: AppRoutes.ImagePreviewScreen.name,
            path: AppRoutes.ImagePreviewScreen.name,
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
        ]),
    GoRoute(
      path: '/${AppRoutes.LoadingScreen.name}',
      name: AppRoutes.LoadingScreen.name,
      pageBuilder: (context, state) {
        var extra = state.extra != null ? (state.extra as Map<String, dynamic>) : null;
        return NoTransitionPage(child: LoadingScreen(canPop: extra?["canPop"] ?? false));
      },
    ),
    GoRoute(
      path: '/${AppRoutes.ErrorScreen.name}',
      name: AppRoutes.ErrorScreen.name,
      pageBuilder: (context, state) {
        var extra = (state.extra as Map<String, dynamic>);

        return NoTransitionPage(child: ErrorScreen(canPop: extra["canPop"] ?? false));
      },
    ),
  ];
}
