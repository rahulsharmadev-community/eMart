// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressCWProxy {
  Address houseNo(String houseNo);

  Address state(({String key, dynamic value}) state);

  Address country(({String key, dynamic value}) country);

  Address postalCode(String postalCode);

  Address plusCode(String? plusCode);

  Address geoCoordinate(({double lat, double lng})? geoCoordinate);

  Address personName(PersonName? personName);

  Address phoneNumber(PhoneNumber? phoneNumber);

  Address email(Email? email);

  Address landmark(String? landmark);

  Address city(String? city);

  Address area(String? area);

  Address floorLevel(int? floorLevel);

  Address district(String? district);

  Address type(AddressType? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    String? houseNo,
    ({String key, dynamic value})? state,
    ({String key, dynamic value})? country,
    String? postalCode,
    String? plusCode,
    ({double lat, double lng})? geoCoordinate,
    PersonName? personName,
    PhoneNumber? phoneNumber,
    Email? email,
    String? landmark,
    String? city,
    String? area,
    int? floorLevel,
    String? district,
    AddressType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddress.copyWith.fieldName(...)`
class _$AddressCWProxyImpl implements _$AddressCWProxy {
  const _$AddressCWProxyImpl(this._value);

  final Address _value;

  @override
  Address houseNo(String houseNo) => this(houseNo: houseNo);

  @override
  Address state(({String key, dynamic value}) state) => this(state: state);

  @override
  Address country(({String key, dynamic value}) country) =>
      this(country: country);

  @override
  Address postalCode(String postalCode) => this(postalCode: postalCode);

  @override
  Address plusCode(String? plusCode) => this(plusCode: plusCode);

  @override
  Address geoCoordinate(({double lat, double lng})? geoCoordinate) =>
      this(geoCoordinate: geoCoordinate);

  @override
  Address personName(PersonName? personName) => this(personName: personName);

  @override
  Address phoneNumber(PhoneNumber? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  Address email(Email? email) => this(email: email);

  @override
  Address landmark(String? landmark) => this(landmark: landmark);

  @override
  Address city(String? city) => this(city: city);

  @override
  Address area(String? area) => this(area: area);

  @override
  Address floorLevel(int? floorLevel) => this(floorLevel: floorLevel);

  @override
  Address district(String? district) => this(district: district);

  @override
  Address type(AddressType? type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    Object? houseNo = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
    Object? plusCode = const $CopyWithPlaceholder(),
    Object? geoCoordinate = const $CopyWithPlaceholder(),
    Object? personName = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? landmark = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? floorLevel = const $CopyWithPlaceholder(),
    Object? district = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Address(
      addressId: _value.addressId,
      houseNo: houseNo == const $CopyWithPlaceholder() || houseNo == null
          ? _value.houseNo
          // ignore: cast_nullable_to_non_nullable
          : houseNo as String,
      state: state == const $CopyWithPlaceholder() || state == null
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as ({String key, dynamic value}),
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as ({String key, dynamic value}),
      postalCode:
          postalCode == const $CopyWithPlaceholder() || postalCode == null
              ? _value.postalCode
              // ignore: cast_nullable_to_non_nullable
              : postalCode as String,
      plusCode: plusCode == const $CopyWithPlaceholder()
          ? _value.plusCode
          // ignore: cast_nullable_to_non_nullable
          : plusCode as String?,
      geoCoordinate: geoCoordinate == const $CopyWithPlaceholder()
          ? _value.geoCoordinate
          // ignore: cast_nullable_to_non_nullable
          : geoCoordinate as ({double lat, double lng})?,
      personName: personName == const $CopyWithPlaceholder()
          ? _value.personName
          // ignore: cast_nullable_to_non_nullable
          : personName as PersonName?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as PhoneNumber?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as Email?,
      landmark: landmark == const $CopyWithPlaceholder()
          ? _value.landmark
          // ignore: cast_nullable_to_non_nullable
          : landmark as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as String?,
      floorLevel: floorLevel == const $CopyWithPlaceholder()
          ? _value.floorLevel
          // ignore: cast_nullable_to_non_nullable
          : floorLevel as int?,
      district: district == const $CopyWithPlaceholder()
          ? _value.district
          // ignore: cast_nullable_to_non_nullable
          : district as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AddressType?,
      createdAt: _value.createdAt,
    );
  }
}

extension $AddressCopyWith on Address {
  /// Returns a callable class that can be used as follows: `instanceOfAddress.copyWith(...)` or like so:`instanceOfAddress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressCWProxy get copyWith => _$AddressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      addressId: json['addressId'] as String?,
      houseNo: json['houseNo'] as String,
      state: _$recordConvert(
        json['state'],
        ($jsonValue) => (
          key: $jsonValue['key'] as String,
          value: $jsonValue['value'],
        ),
      ),
      country: _$recordConvert(
        json['country'],
        ($jsonValue) => (
          key: $jsonValue['key'] as String,
          value: $jsonValue['value'],
        ),
      ),
      postalCode: json['postalCode'] as String,
      plusCode: json['plusCode'] as String?,
      geoCoordinate: _$recordConvertNullable(
        json['geoCoordinate'],
        ($jsonValue) => (
          lat: ($jsonValue['lat'] as num).toDouble(),
          lng: ($jsonValue['lng'] as num).toDouble(),
        ),
      ),
      personName: json['personName'] == null
          ? null
          : PersonName.fromJson(json['personName'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] == null
          ? null
          : PhoneNumber.fromJson(json['phoneNumber'] as String),
      email: json['email'] == null
          ? null
          : Email.fromJson(json['email'] as String),
      landmark: json['landmark'] as String?,
      city: json['city'] as String?,
      area: json['area'] as String?,
      floorLevel: (json['floorLevel'] as num?)?.toInt(),
      district: json['district'] as String?,
      type: $enumDecodeNullable(_$AddressTypeEnumMap, json['type']),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressId': instance.addressId,
      'houseNo': instance.houseNo,
      'state': <String, dynamic>{
        'key': instance.state.key,
        'value': instance.state.value,
      },
      'country': <String, dynamic>{
        'key': instance.country.key,
        'value': instance.country.value,
      },
      'postalCode': instance.postalCode,
      'geoCoordinate': instance.geoCoordinate == null
          ? null
          : <String, dynamic>{
              'lat': instance.geoCoordinate!.lat,
              'lng': instance.geoCoordinate!.lng,
            },
      'personName': instance.personName?.toJson(),
      'phoneNumber': instance.phoneNumber?.toJson(),
      'email': instance.email?.toJson(),
      'city': instance.city,
      'area': instance.area,
      'landmark': instance.landmark,
      'floorLevel': instance.floorLevel,
      'district': instance.district,
      'plusCode': instance.plusCode,
      'type': _$AddressTypeEnumMap[instance.type],
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);

const _$AddressTypeEnumMap = {
  AddressType.home: 'home',
  AddressType.business: 'business',
  AddressType.office: 'office',
  AddressType.hotel: 'hotel',
  AddressType.other: 'other',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
