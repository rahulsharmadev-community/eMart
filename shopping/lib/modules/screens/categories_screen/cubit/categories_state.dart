part of 'categories_cubit.dart';

final class CategoriesState extends Equatable {
  final BlocState<List<Category>> categories;
  final BlocState<List<Categories>> categoriesMetaData;
  const CategoriesState(this.categories, this.categoriesMetaData);

  const CategoriesState.loading()
      : categories = const BlocStateLoading(),
        categoriesMetaData = const BlocStateLoading();

  CategoriesState copyWith(
          {BlocState<List<Category>>? categories, BlocState<List<Categories>>? categoriesMetaData}) =>
      CategoriesState(
        categories ?? this.categories,
        categoriesMetaData ?? this.categoriesMetaData,
      );

  @override
  List<Object> get props => [categories, categoriesMetaData];
}
