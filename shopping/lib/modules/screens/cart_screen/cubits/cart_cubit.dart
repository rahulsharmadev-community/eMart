// ignore_for_file: no_wildcard_variable_uses

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/core/repository.dart';

class Cart {
  final List<({Product product, int count})> list;
  final double amount;
  Cart([this.list = const []])
      : amount = list.fold(0, (sum, e) => sum += (e.product.discountedPrice * e.count));
}

class CartCubit extends Cubit<BlocState<Cart>> {
  final ProductRepository productRepository;
  final PrimaryUserBloc primaryUserBloc;

  CartCubit(this.primaryUserBloc)
      : productRepository = repository.product,
        super(const BlocStateLoading()) {
    if (primaryUserBloc.primaryUser?.user.cartProducts.isEmpty ?? true) {
      emit(BlocStateSuccess(Cart()));
    } else {
      newMethod(primaryUserBloc.state);
      primaryUserBloc.stream.listen((_) => newMethod(_));
    }
  }

  void newMethod(BlocState<PrimaryUser> bs) async {
    if (bs.isSuccess) {
      var ls = primaryUserBloc.primaryUser!.user.cartProducts;
      try {
        var value = await productRepository.getAll(ls.keys.toList());
        if (value == null) return;
        var list = value.map((e) => (product: e, count: ls[e.productId] ?? 0)).toList();
        emit(BlocStateSuccess(Cart(list)));
      } catch (e) {
        emit(BlocStateFailure(e.toString()));
      }
    }
  }
}
