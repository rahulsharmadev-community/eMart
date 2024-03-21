import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

class KeywordBloc extends Bloc<SearchEvent, SearchState> {
  final KeywordsRepository repository;
  KeywordBloc(this.repository) : super(SearchStateEmpty()) {
    on<SearchTextChanged>(newMethod, transformer: debounce(_duration));
  }

  FutureOr<void> newMethod(SearchTextChanged event, Emitter<SearchState> emit) async {
    repository.searchWord(event.text);
    if (event.text.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());
    try {
      final temp = await repository.searchWord(event.text);
      emit(SearchStateSuccess(temp));
    } catch (e) {
      emit(SearchStateError("something went wrong"));
    }
  }
}
