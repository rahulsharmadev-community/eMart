part of 'keyword_bloc.dart';

@immutable
sealed class SearchState extends Equatable {}

final class SearchStateEmpty extends SearchState {
  @override
  List<Object?> get props => [];
}

final class SearchStateLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

final class SearchStateSuccess extends SearchState {
  final Keywords keywords;
  SearchStateSuccess(this.keywords);

  @override
  List<Object?> get props => keywords;
}

final class SearchStateError extends SearchState {
  final String errorMsg;
  SearchStateError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
