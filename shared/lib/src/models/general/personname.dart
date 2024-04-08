import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/src/helper.dart';
import 'package:jars_core/jars_core.dart';
part 'personname.g.dart';

@CopyWith()
@defJson
class PersonName {
  final String firstName;
  final String? lastName;
  final String? middleName;

  PersonName({
    required this.firstName,
    this.lastName,
    this.middleName,
  }) : assert(firstName.isNotEmpty, 'first name should not be empty.');

  factory PersonName.fromJson(JSON json) => _$PersonNameFromJson(json);
  JSON toJson() => _$PersonNameToJson(this);

  @override
  String toString() =>
      "$firstName${middleName != null ? " $middleName" : ""}${lastName != null ? " $lastName" : ""}";
}
