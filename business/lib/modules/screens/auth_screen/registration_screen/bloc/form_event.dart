part of 'form_bloc.dart';

sealed class FormEvent {}

class OnChange extends FormEvent {
  OnChange();
}

class OnSubmit extends FormEvent {
  final VoidCallback callback;
  OnSubmit(this.callback);
}

class FetchGeoCoordinate extends FormEvent {
  final GeoCoordinate coordinate;
  FetchGeoCoordinate(this.coordinate);
}
