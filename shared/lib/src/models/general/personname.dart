import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/equatable.dart';
import 'package:jars/regpatterns.dart';
import 'package:shared/src/json_converters.dart';
import 'package:jars/jars_core.dart';
part 'personname.g.dart';

@CopyWith()
@defJsonSerializable
class PersonName extends Equatable with ValidatorMixin {
  final String firstName;
  final String? lastName;
  final String? middleName;
  const PersonName({
    required this.firstName,
    this.lastName,
    this.middleName,
  });

  @override
  void validator() {
    var pattern = regPatterns.name;
    toString().regNotMatch(pattern, throwError: true);
  }

  factory PersonName.fromJson(JSON json) => _$PersonNameFromJson(json);
  JSON toJson() => _$PersonNameToJson(this);

  factory PersonName.fromString(String string) {
    var list = string.trim().replaceAll(RegExp(r'\s+'), ' ').split(' ');
    return PersonName(
        firstName: list[0], middleName: list.elementAtOrNull(1), lastName: list.elementAtOrNull(2));
  }

  @override
  String toString() =>
      "$firstName${middleName != null ? " $middleName" : ""}${lastName != null ? " $lastName" : ""}";

  @override
  List<Object?> get props => [firstName, lastName, middleName];
}
