import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';

class Cart {
  final List<({Product product, int count})> list;
  final double amount;
  Cart([this.list = const []])
      : amount =
            list.map((e) => e.product.discountedPrice * e.count).reduce((value, element) => value + element);
}

class CartCubit extends Cubit<BlocState<Cart>> {
  final ProductRepository repository;
  final PrimaryUserBloc primaryUserBloc;

  CartCubit(this.repository, this.primaryUserBloc) : super(const BlocStateLoading()) {
    if (primaryUserBloc.primaryUser?.user.cartProducts.isEmpty ?? true) {
      emit(BlocStateSuccess(Cart()));
    } else {
      newMethod();
      primaryUserBloc.stream.listen((_) => newMethod());
    }
  }

  void newMethod() {
    var ls = primaryUserBloc.primaryUser!.user.cartProducts;
    Future.value(repository.getAll(ls.keys.toList())).then((value) {
      if (value == null) return;

      var list = value.map((e) => (product: e, count: ls[e.productId] ?? 0)).toList();
      emit(BlocStateSuccess(Cart(list)));
    }).catchError((e) {
      emit(BlocStateFailure(e.toString()));
    });
  }
}
