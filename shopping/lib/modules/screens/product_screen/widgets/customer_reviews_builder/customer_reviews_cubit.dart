import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/repository.dart';

class CustomerReviewsCubit extends Cubit<BlocState<List<Review>>> {
  final String productId;
  final ReviewsRepository reviewsRepository;
  CustomerReviewsCubit({required this.productId})
      : reviewsRepository = repository.reviews,
        super(const BlocStateLoading()) {
    fetch();
  }

  fetch() async {
    emit(const BlocStateLoading());
    var n = await reviewsRepository.getReviews(productId);
    if (n != null) emit(BlocStateSuccess(n));
  }
}
