import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/models.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<Event> debounce<Event>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);

class KeywordBloc extends Bloc<SearchEvent, SearchState> {
  final KeywordsRepository repository;
  KeywordBloc(this.repository) : super(SearchStateEmpty()) {
    on<SearchTextChanged>(newMethod, transformer: debounce(300.milliseconds));
  }

  FutureOr<void> newMethod(SearchTextChanged event, Emitter<SearchState> emit) async {
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
