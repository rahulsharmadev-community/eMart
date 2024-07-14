part of 'content_cubit.dart';

@immutable
sealed class ContentState {}

final class ContentLoading extends ContentState {
  final String? message;
  ContentLoading([this.message]);
}

final class ContentLoaded extends ContentState {
  final List<String> path;
  final List<String> expendable;

  /// selectable <=> unExpendable
  final List<String> selectable;

  int get length => expendable.length + selectable.length;

  ContentLoaded({
    required this.path,
    required this.expendable,
    required this.selectable,
  });
}

final class ContentError extends ContentState {
  final Exception exception;
  ContentError(this.exception);
}
