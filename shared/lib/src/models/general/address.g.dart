// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressCWProxy {
  Address houseNo(String houseNo);

  Address state(String state);

  Address country(String country);

  Address pincode(String pincode);

  Address city(String? city);

  Address area(String? area);

  Address floorLevel(int? floorLevel);

  Address district(String? district);

  Address location(Location? location);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    String? houseNo,
    String? state,
    String? country,
    String? pincode,
    String? city,
    String? area,
    int? floorLevel,
    String? district,
    Location? location,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddress.copyWith.fieldName(...)`
class _$AddressCWProxyImpl implements _$AddressCWProxy {
  const _$AddressCWProxyImpl(this._value);

  final Address _value;

  @override
  Address houseNo(String houseNo) => this(houseNo: houseNo);

  @override
  Address state(String state) => this(state: state);

  @override
  Address country(String country) => this(country: country);

  @override
  Address pincode(String pincode) => this(pincode: pincode);

  @override
  Address city(String? city) => this(city: city);

  @override
  Address area(String? area) => this(area: area);

  @override
  Address floorLevel(int? floorLevel) => this(floorLevel: floorLevel);

  @override
  Address district(String? district) => this(district: district);

  @override
  Address location(Location? location) => this(location: location);

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
    Object? pincode = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? floorLevel = const $CopyWithPlaceholder(),
    Object? district = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
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
          : state as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      pincode: pincode == const $CopyWithPlaceholder() || pincode == null
          ? _value.pincode
          // ignore: cast_nullable_to_non_nullable
          : pincode as String,
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
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as Location?,
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
      state: json['state'] as String,
      country: json['country'] as String,
      pincode: json['pincode'] as String,
      city: json['city'] as String?,
      area: json['area'] as String?,
      floorLevel: json['floorLevel'] as int?,
      district: json['district'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'addressId': instance.addressId,
      'houseNo': instance.houseNo,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'city': instance.city,
      'area': instance.area,
      'floorLevel': instance.floorLevel,
      'district': instance.district,
      'location': instance.location?.toJson(),
      'createdAt': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'lastUpdateAt': _$JsonConverterToJson<int, DateTime>(
          instance.lastUpdateAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
