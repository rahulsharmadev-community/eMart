import 'package:business/utility/routes/routes.dart';
import 'package:jars/go_router.dart';
import 'package:jars/jars.dart';

final defaultRouterConfig = _AppRouterConfig();

class _AppRouterConfig extends GoRouterConfig {
  @override
  GoRouter get config {
    return GoRouter(
        initialLocation: AppRoutes.EditProductRoute.path,
        observers: [RouteNavigatorObserver()],
        navigatorKey: rootNavigatorKey,
        routes: [
          JRoute(AppRoutes.EditProductRoute),
        ]);
  }
}
