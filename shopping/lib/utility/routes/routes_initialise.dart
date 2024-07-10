// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shopping/modules/screens/address_screen/address_screen.dart';
import 'package:shopping/modules/screens/address_screen/edit_address_screen.dart';
import 'package:shopping/modules/screens/categories_screen/categories_screen.dart';
import 'package:shopping/modules/screens/home_screen/home_screen.dart';
import 'package:shopping/modules/screens/order_screen/order_screen.dart';
import 'package:shopping/modules/screens/other_screens/error_screen.dart';
import 'package:shopping/modules/screens/other_screens/image_preview_screen.dart';
import 'package:shopping/modules/screens/other_screens/loading_screen.dart';
import 'package:shopping/modules/screens/product_query_builder/product_query_builder.dart';
import 'package:shopping/modules/screens/product_screen/product_screen.dart';
import 'package:shopping/modules/screens/search_screen/mobile/search_screen.dart';
import 'package:shopping/modules/screens/wishlist_screen/wishlist_screen.dart';
import 'routes_declare.dart';

const AppRoutes = _AppRoutesInitialise();

class _AppRoutesInitialise with AppRoutesDeclare<Route> {
  const _AppRoutesInitialise();

  @override
  Route get CartRoute => Route(
        name: 'cart_screen',
        builder: (context, state) => FadeTransitionPage(
            child: CategoriesScreen(
          category: state.uri.queryParameters['search'],
        )),
      );

  @override
  Route get CategoriesRoute => Route(
        name: 'categories_screen',
        builder: (context, state) => FadeTransitionPage(
          child: CategoriesScreen(category: state.uri.queryParameters['search']),
        ),
      );

  @override
  Route get HomeRoute => Route(
        name: 'home_screen',
        builder: (p0, p1) => FadeTransitionPage(child: const HomeScreen()),
      );

  @override
  Route get OrdersRoute => Route(
        name: 'orders_screen',
        builder: (p0, p1) => FadeTransitionPage(child: const OrdersScreen()),
      );

  @override
  Route get ProductQueryRoute => Route(
      name: 'product_query_screen',
      builder: (context, state) {
        Set<Query> child = {};
        if (state.extra is Query) child = {state.extra as Query};
        if (state.extra is Iterable) child = (state.extra as Iterable<Query>).toSet();
        return ProductQueryBuilder(child);
      });

  @override
  Route get ProfileRoute => Route(
        name: 'profile_screen',
        builder: (p0, p1) => FadeTransitionPage(child: const ProfileScreen()),
      );

  @override
  Route get WishlistRoute => Route(
        name: 'wishlist_screen',
        builder: (p0, p1) => FadeTransitionPage(child: const WishlistScreen()),
      );

  @override
  Route get AddressRoute => Route(
        name: 'address_screen',
        builder: (context, state) => const AddressScreen(),
      );

  @override
  Route get EditAddressRoute => Route(
        name: 'edit_address_screen',
        builder: (context, state) => EditAddressScreen(oldAddressId: state.uri.queryParameters['edit']),
      );

  @override
  Route get ErrorRoute => Route(
        name: 'error_screen',
        builder: (context, state) {
          var extra = (state.extra as Map<String, dynamic>);
          return NoTransitionPage(child: ErrorScreen(canPop: extra["canPop"] ?? false));
        },
      );

  @override
  Route get ImagePreviewRoute => Route(
        name: 'image_preview_screen',
        builder: (context, state) {
          var extra = state.extra as Map<String, dynamic>;
          return ImagePreviewScreen(
            title: extra['title'],
            urls: extra['urls'],
            onDone: extra['onDone'],
          );
        },
      );

  @override
  Route get LoadingRoute => Route(
        name: 'loading_screen',
        builder: (context, state) {
          var extra = state.extra != null ? (state.extra as Map<String, dynamic>) : null;
          return NoTransitionPage(child: LoadingScreen(canPop: extra?["canPop"] ?? false));
        },
      );

  @override
  Route get ProductRoute => Route(
        name: 'product_screen',
        builder: (context, state) => ProductScreen(state.extra as String),
      );

  @override
  Route get SearchKeywordRoute => Route(
        name: 'search_keyword_screen',
        builder: (context, state) {
          var extra = state.extra as JSON?;
          return SearchKeywordScreen(
            initalText: extra?['initalText'],
            hintText: extra?['hintText'],
            whenEmpty: extra?['whenEmpty'],
            whenNotFound: extra?['whenNotFound'],
          );
        },
      );
}
