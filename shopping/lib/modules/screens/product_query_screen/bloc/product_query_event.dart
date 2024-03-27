part of 'product_query_bloc.dart';

@immutable
sealed class ProductQueryEvent {}

class ProductQueryInitiateEvent extends ProductQueryEvent {
  final List<Query> queryParameters;

  ProductQueryInitiateEvent(this.queryParameters);
}
