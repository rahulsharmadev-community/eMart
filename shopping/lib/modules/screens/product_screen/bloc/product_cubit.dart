import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/core/repository.dart';

typedef ProductState = BlocState<model.Product>;
typedef ProductLoadingState = BlocStateLoading<model.Product>;
typedef ProductLoadedState = BlocStateSuccess<model.Product>;
typedef ProductErrorState = BlocStateFailure<model.Product>;

class ProductCubit extends Cubit<ProductState> {
  final String productId;
  final ProductRepository productRepository;
  ProductCubit({
    required this.productId,
  })  : productRepository = repository.product,
        super(const ProductLoadingState()) {
    fetch();
  }

  fetch() async {
    try {
      emit(const ProductLoadingState());
      var product = await productRepository.get(productId);
      emit(product != null ? ProductLoadedState(product) : const ProductErrorState('Not Found'));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
}
