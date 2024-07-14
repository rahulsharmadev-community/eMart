// ignore_for_file: non_constant_identifier_names

import 'package:business/modules/screens/edit_product_screen/widgets/edit_product_screen.dart';
import 'package:jars/jars.dart';

abstract interface class _RoutesDefine<T> {
  T get EditProductRoute; // work for both create & edit existing one.
}

final AppRoutes = _AppRoutes();

class _AppRoutes extends _RoutesDefine<Route> {
  @override
  Route get EditProductRoute => Route(
        name: 'edit_product',
        builder: (ctx, state) => const EditProductScreen(),
      );
}
