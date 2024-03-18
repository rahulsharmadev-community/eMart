import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'typedef.dart';
import 'package:regpatterns/regpatterns.dart';
part 'personname.g.dart';

@CopyWith()
@JsonSerializable()
class PersonName {
  final String firstName;
  final String? lastName;
  final String? middleName;

  PersonName({
    required this.firstName,
    this.lastName,
    this.middleName,
  }) : assert(((RegPatterns.name() as RegPatterns).hasMatch(firstName)), 'first name should not be empty.');

  factory PersonName.fromJson(JSON json) => _$PersonNameFromJson(json);
  JSON toJson() => _$PersonNameToJson(this);

  @override
  String toString() =>
      "$firstName${middleName != null ? " $middleName" : ""}${lastName != null ? " $lastName" : ""}";
}
