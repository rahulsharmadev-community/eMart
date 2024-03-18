// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocationCWProxy {
  Location name(String? name);

  Location address(String? address);

  Location coordinate(({double lat, double long}) coordinate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Location(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Location(...).copyWith(id: 12, name: "My name")
  /// ````
  Location call({
    String? name,
    String? address,
    ({double lat, double long})? coordinate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLocation.copyWith.fieldName(...)`
class _$LocationCWProxyImpl implements _$LocationCWProxy {
  const _$LocationCWProxyImpl(this._value);

  final Location _value;

  @override
  Location name(String? name) => this(name: name);

  @override
  Location address(String? address) => this(address: address);

  @override
  Location coordinate(({double lat, double long}) coordinate) =>
      this(coordinate: coordinate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Location(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Location(...).copyWith(id: 12, name: "My name")
  /// ````
  Location call({
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? coordinate = const $CopyWithPlaceholder(),
  }) {
    return Location(
      id: _value.id,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      createdAt: _value.createdAt,
      coordinate:
          coordinate == const $CopyWithPlaceholder() || coordinate == null
              ? _value.coordinate
              // ignore: cast_nullable_to_non_nullable
              : coordinate as ({double lat, double long}),
    );
  }
}

extension $LocationCopyWith on Location {
  /// Returns a callable class that can be used as follows: `instanceOfLocation.copyWith(...)` or like so:`instanceOfLocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LocationCWProxy get copyWith => _$LocationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      coordinate: _$recordConvert(
        json['coordinate'],
        ($jsonValue) => (
          lat: ($jsonValue['lat'] as num).toDouble(),
          long: ($jsonValue['long'] as num).toDouble(),
        ),
      ),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'coordinate': {
        'lat': instance.coordinate.lat,
        'long': instance.coordinate.long,
      },
      'name': instance.name,
      'address': instance.address,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
