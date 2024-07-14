import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

typedef PathState = List<String>;

class PathCubit extends Cubit<PathState> {
  PathCubit([super.inital = const []]);

  /// Set the current path
  void setPath(List<String> path) => emit(path);

  /// Clear the current path
  void clearPath() => emit(const []);

  /// Add a path to the current path
  void addPath(String path) => emit([...state, path]);

  /// Remove a path till the given path
  void removePath(String str) {
    int start = state.indexOf(str);
    if (start == -1) return;
    emit(state..removeRange(start, state.length));
  }
}
