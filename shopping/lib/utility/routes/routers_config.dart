// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/blocs/app_meta_data.dart';
import 'package:shopping/modules/screens/dashboard/dashboard.dart';
import 'routes_initialise.dart';
import 'package:jars/jars.dart';

class AppRouterConfig extends GoRouterConfig {
  AppRouterConfig._();
  static final instance = AppRouterConfig._();
  final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  @override
  get config {
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoutes.HomeRoute.path,
      observers: [RouteNavigatorObserver()],
      routes: [
        ShellRoute(
            parentNavigatorKey: rootNavigatorKey,
            navigatorKey: shellNavigatorKey,
            builder: (context, state, child) {
              return BlocBuilder<AppMetaDataBloc, BlocState>(
                builder: (context, state) {
                  return Platform.isMobileorTablet
                      ? eMartMobileDashBoard(child: child)
                      : eMartWebDashBoard(child: child);
                },
              );
            },
            routes: [
              JRoute(AppRoutes.HomeRoute),
              JRoute(AppRoutes.CategoriesRoute),
              JRoute(AppRoutes.CartRoute),
              JRoute(AppRoutes.WishlistRoute),
              JRoute(AppRoutes.ProfileRoute),
              JRoute(AppRoutes.ProductQueryRoute),
            ]),
        JRoute(AppRoutes.ProductRoute),
        JRoute(AppRoutes.AddressRoute),
        JRoute(AppRoutes.EditAddressRoute),
        JRoute(AppRoutes.SearchKeywordRoute),
        JRoute(AppRoutes.ImagePreviewRoute),
        JRoute(AppRoutes.LoadingRoute),
        JRoute(AppRoutes.ErrorRoute),
      ],
    );
  }
}
