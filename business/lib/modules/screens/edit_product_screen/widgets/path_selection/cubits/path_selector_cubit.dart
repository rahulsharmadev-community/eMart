import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'path_selector_state.dart';

class PathSelectorCubit extends Cubit<PathSelectorState> {
  PathSelectorCubit() : super(PathSelectorLoading());
}

// path, comtent loading
// path, content loaded
// path, content error

// content States
// content loading
// content loaded
// content error

