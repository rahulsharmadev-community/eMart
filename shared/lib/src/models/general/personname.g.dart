// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personname.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonNameCWProxy {
  PersonName firstName(String firstName);

  PersonName lastName(String? lastName);

  PersonName middleName(String? middleName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonName(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonName(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonName call({
    String? firstName,
    String? lastName,
    String? middleName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonName.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonName.copyWith.fieldName(...)`
class _$PersonNameCWProxyImpl implements _$PersonNameCWProxy {
  const _$PersonNameCWProxyImpl(this._value);

  final PersonName _value;

  @override
  PersonName firstName(String firstName) => this(firstName: firstName);

  @override
  PersonName lastName(String? lastName) => this(lastName: lastName);

  @override
  PersonName middleName(String? middleName) => this(middleName: middleName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonName(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonName(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonName call({
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? middleName = const $CopyWithPlaceholder(),
  }) {
    return PersonName(
      firstName: firstName == const $CopyWithPlaceholder() || firstName == null
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      middleName: middleName == const $CopyWithPlaceholder()
          ? _value.middleName
          // ignore: cast_nullable_to_non_nullable
          : middleName as String?,
    );
  }
}

extension $PersonNameCopyWith on PersonName {
  /// Returns a callable class that can be used as follows: `instanceOfPersonName.copyWith(...)` or like so:`instanceOfPersonName.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonNameCWProxy get copyWith => _$PersonNameCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonName _$PersonNameFromJson(Map<String, dynamic> json) => PersonName(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
    );

Map<String, dynamic> _$PersonNameToJson(PersonName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
    };
