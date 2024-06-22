// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmployeeCWProxy {
  Employee name(PersonName name);

  Employee email(Email email);

  Employee phoneNumber(PhoneNumber phoneNumber);

  Employee role(EmployeeRole role);

  Employee panNumber(String panNumber);

  Employee address(Address address);

  Employee profileImg(String? profileImg);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Employee(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Employee(...).copyWith(id: 12, name: "My name")
  /// ````
  Employee call({
    PersonName? name,
    Email? email,
    PhoneNumber? phoneNumber,
    EmployeeRole? role,
    String? panNumber,
    Address? address,
    String? profileImg,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEmployee.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEmployee.copyWith.fieldName(...)`
class _$EmployeeCWProxyImpl implements _$EmployeeCWProxy {
  const _$EmployeeCWProxyImpl(this._value);

  final Employee _value;

  @override
  Employee name(PersonName name) => this(name: name);

  @override
  Employee email(Email email) => this(email: email);

  @override
  Employee phoneNumber(PhoneNumber phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  Employee role(EmployeeRole role) => this(role: role);

  @override
  Employee panNumber(String panNumber) => this(panNumber: panNumber);

  @override
  Employee address(Address address) => this(address: address);

  @override
  Employee profileImg(String? profileImg) => this(profileImg: profileImg);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Employee(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Employee(...).copyWith(id: 12, name: "My name")
  /// ````
  Employee call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? panNumber = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
  }) {
    return Employee(
      uid: _value.uid,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as PersonName,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as Email,
      phoneNumber:
          phoneNumber == const $CopyWithPlaceholder() || phoneNumber == null
              ? _value.phoneNumber
              // ignore: cast_nullable_to_non_nullable
              : phoneNumber as PhoneNumber,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as EmployeeRole,
      panNumber: panNumber == const $CopyWithPlaceholder() || panNumber == null
          ? _value.panNumber
          // ignore: cast_nullable_to_non_nullable
          : panNumber as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address,
      profileImg: profileImg == const $CopyWithPlaceholder()
          ? _value.profileImg
          // ignore: cast_nullable_to_non_nullable
          : profileImg as String?,
      createdAt: _value.createdAt,
    );
  }
}

extension $EmployeeCopyWith on Employee {
  /// Returns a callable class that can be used as follows: `instanceOfEmployee.copyWith(...)` or like so:`instanceOfEmployee.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmployeeCWProxy get copyWith => _$EmployeeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      uid: json['uid'] as String?,
      name: PersonName.fromJson(json['name'] as Map<String, dynamic>),
      email: Email.fromJson(json['email'] as Map<String, dynamic>),
      phoneNumber:
          PhoneNumber.fromJson(json['phoneNumber'] as Map<String, dynamic>),
      role: EmployeeRole.fromJson(json['role'] as Map<String, dynamic>),
      panNumber: json['panNumber'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      profileImg: json['profileImg'] as String?,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'uid': instance.uid,
      'profileImg': instance.profileImg,
      'name': instance.name.toJson(),
      'email': instance.email.toJson(),
      'phoneNumber': instance.phoneNumber.toJson(),
      'role': instance.role.toJson(),
      'address': instance.address.toJson(),
      'panNumber': instance.panNumber,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
