import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';
import 'package:jars/jars.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesCubit({
    required this.categoriesRepository,
  }) : super(const CategoriesState.loading());

  fetchData(List<String>? data) async {
    CategoriesState temp = state;
    if (data == null) {
      categoriesRepository.getALL().then((value) {
        temp = temp.copyWith(categories: BlocStateSuccess(value));
        emit(temp);
      }).catchError((e) {
        emit(temp.copyWith(categories: BlocStateFailure('Error fetching metadata: $e')));
      });
    } else {
      categoriesRepository.get(data).then((value) {
        temp = temp.copyWith(categories: BlocStateSuccess(value ?? []));
        emit(temp);
      }).catchError((e) {
        emit(temp.copyWith(categories: BlocStateFailure('Error fetching metadata: $e')));
      });
    }

    emit(temp);
  }
}
