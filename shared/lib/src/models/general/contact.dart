import 'package:equatable/equatable.dart';
import 'package:jars/jars.dart';

abstract class Contact extends Equatable with ValidatorMixin {
  final String value;
  const Contact(this.value);

  JSON toJson();

  @override
  String toString() => value;

  @override
  List<Object?> get props => [value];
}

class Email extends Contact {
  const Email(super.value);
  @override
  void validator() {
    value.regNotMatch(regPatterns.email, throwError: true);
  }

  factory Email.fromJson(JSON json) => Email(json['email']);
  @override
  JSON toJson() => {'email': value};
}

class PhoneNumber extends Contact {
  const PhoneNumber(super.value);

  @override
  void validator() {
    value.regNotMatch(regPatterns.phoneNumber, throwError: true);
  }

  factory PhoneNumber.fromJson(JSON json) => PhoneNumber(json['phoneNumber']);
  @override
  JSON toJson() => {'phoneNumber': value};
}
