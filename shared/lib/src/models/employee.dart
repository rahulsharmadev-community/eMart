import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';
import 'package:shared/src/models/general/contact.dart';
import 'package:uuid/uuid.dart';
part 'employee.g.dart';

@CopyWith()
@defJsonSerializable
class Employee extends Equatable with ValidatorMixin {
  Employee({
    String? uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.panNumber,
    required this.address,
    this.profileImg,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : uid = uid ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @override
  void validator() {
    RegPattern pattern;
    pattern = regPatterns.panNumber(
      typeRestriction: PanType.INDIVIDUAL_PERSON,
      firstName: name.firstName,
      middle: name.middleName,
      lastName: name.lastName,
    );

    if (panNumber.regNotMatch(pattern)) {
      throw ArgumentError(pattern.message);
    }

    if (profileImg?.regNotMatch(regPatterns.url) ?? false) {
      throw ArgumentError('Invalid image url found in `imageUrls`.');
    }
    name.validator();
    email.validator();
    phoneNumber.validator();
  }

  /// Unique Identification numbers
  @CopyWithField.immutable()
  final String uid;

  /// Optional profile image URL
  final String? profileImg;

  /// Seller's name represented as a PersonName object
  final PersonName name;

  /// Seller's email address
  final Email email;

  /// Seller phone number
  final PhoneNumber phoneNumber;

  final EmployeeRole role;

  /// Seller residential address
  final Address address;

  /// The Permanent Account Number (PAN) associated with the seller.
  final String panNumber;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Employee.fromJson(JSON json) => _$EmployeeFromJson(json);

  JSON toJson() => _$EmployeeToJson(this);

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phoneNumber,
        role,
        panNumber,
        address,
        profileImg,
        createdAt,
        // ignore lastUpdateAt
      ];
}
