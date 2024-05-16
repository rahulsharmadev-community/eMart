part of 'form_bloc.dart';

sealed class FormEvent {}

class OnChange extends FormEvent {
  OnChange();
}

class OnSubmit extends FormEvent {
  final Function(model.Address address) callback;
  OnSubmit(this.callback);
}

class OverrideNamePhoneNo extends FormEvent {
  final model.PersonName name;
  final String? phoneNumber;
  OverrideNamePhoneNo(this.name, this.phoneNumber);
}

class FetchGeoCoordinate extends FormEvent {
  final GeoCoordinate coordinate;
  FetchGeoCoordinate(this.coordinate);
}
