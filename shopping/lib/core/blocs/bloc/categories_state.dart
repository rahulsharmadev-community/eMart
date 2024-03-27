part of 'categories_cubit.dart';

sealed class CategoriesState<T> {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final String errorMsg;
  CategoriesError(this.errorMsg);
}

final class CategoriesLoaded extends CategoriesState {
  final List<Categories> categories;
  CategoriesLoaded(this.categories);
}
