part of 'keyword_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchStateEmpty extends SearchState {}

final class SearchStateLoading extends SearchState {}

final class SearchStateSuccess extends SearchState {
  final Keywords keywords;
  SearchStateSuccess(this.keywords);
}

final class SearchStateError extends SearchState {
  final String errorMsg;
  SearchStateError(this.errorMsg);
}
