import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';

class CustomerReviewsCubit extends Cubit<BlocState<List<Review>>> {
  final String productId;
  final ReviewsRepository repository;
  CustomerReviewsCubit({required this.productId, required this.repository})
      : super(const BlocStateLoading()) {
    fetch();
  }

  fetch() async {
    emit(const BlocStateLoading());
    var n = await repository.getReviews(productId);
    if (n != null) emit(BlocStateSuccess(n));
  }
}
