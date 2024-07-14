part of 'path_selector_cubit.dart';

@immutable
sealed class PathSelectorState {}

final class PathSelectorLoading extends PathSelectorState {
  final String? message;
  PathSelectorLoading([this.message]);
}

final class PathSelectorLoaded extends PathSelectorState {
  final List<String> path;
  final List<String> values;
  final bool isExpanded;
  PathSelectorLoaded({
    required this.path,
    required this.values,
    required this.isExpanded,
  });
}

final class PathSelectorError extends PathSelectorState {
  final Exception exception;
  PathSelectorError(this.exception);
}
