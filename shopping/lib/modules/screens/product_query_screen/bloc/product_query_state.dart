part of 'product_query_bloc.dart';

@immutable
sealed class ProductQueryState {}

final class ProductQueryLoading extends ProductQueryState {}

final class ProductQueryError extends ProductQueryState {
  final String errorMsg;
  ProductQueryError(this.errorMsg);
}

final class ProductQuerySuccess extends ProductQueryState {
  final List<Product> products;
  ProductQuerySuccess(this.products);
}
