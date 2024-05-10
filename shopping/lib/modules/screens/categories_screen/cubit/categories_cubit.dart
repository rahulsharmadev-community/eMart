import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';
import 'package:jars/jars.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<BlocState<List<Category>>> {
  final CategoriesRepository categoriesRepository;
  CategoriesCubit({
    required this.categoriesRepository,
  }) : super(const BlocStateLoading());

  fetchData(List<String>? keys) async {
    if (keys == null) {
      categoriesRepository.getALL().then((value) {
        emit(BlocStateSuccess(value));
      }).catchError((e) {
        emit(BlocStateFailure('Error fetching metadata: $e'));
      });
    } else {
      categoriesRepository.get(keys).then((value) {
        emit(BlocStateSuccess(value ?? []));
      }).catchError((e) {
        emit(BlocStateFailure('Error fetching metadata: $e'));
      });
    }
  }
}
