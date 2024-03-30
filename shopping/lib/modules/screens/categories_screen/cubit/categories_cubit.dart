import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/utility/bloc_state.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository categoriesRepository;
  final AppMetaDataRepository metaDataRepository;
  CategoriesCubit({
    required this.categoriesRepository,
    required this.metaDataRepository,
  }) : super(const CategoriesState.loading());

  fetchData() async {
    var temp = state;

    categoriesRepository.getALL().then((value) {
      temp = temp.copyWith(categories: BlocStateSuccess(value));
      emit(temp);
    }).catchError((e) {
      emit(temp.copyWith(categories: BlocStateFailure('Error fetching metadata: $e')));
    });

    metaDataRepository.get().then((value) {
      temp = temp.copyWith(categoriesMetaData: BlocStateSuccess(value!.categories));
      emit(temp);
    }).catchError((e) {
      emit(temp.copyWith(categories: BlocStateFailure('Error fetching metadata: $e')));
    });
  }
}
