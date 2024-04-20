import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart' as model;

class ProductCubit extends Cubit<BlocState<model.Product>> {
  final String productId;
  final ProductRepository repository;
  ProductCubit({
    required this.productId,
    required this.repository,
  }) : super(const BlocStateLoading()) {
    fetch();
  }

  fetch() async {
    var product = await repository.get(productId);
    if (product != null) emit(BlocStateSuccess(product));
  }
}
