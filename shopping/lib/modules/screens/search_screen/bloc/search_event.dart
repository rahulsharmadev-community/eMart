part of 'keyword_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchTextChanged extends SearchEvent {
  final String text;

  SearchTextChanged(this.text);

  @override
  String toString() => 'TextChanged { text: $text }';
}
