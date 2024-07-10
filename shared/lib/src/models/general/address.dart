import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jars/regpatterns.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';
import 'package:jars/jars_core.dart';
import 'package:uuid/uuid.dart';

part 'address.g.dart';

enum AddressType {
  home(Icons.home_rounded),
  business(Icons.store),
  office(Icons.home_work_rounded),
  hotel(Icons.cottage_rounded),
  other(Icons.location_on);

  final IconData icon;
  const AddressType(this.icon);

  @override
  String toString() => name.reCase.pascalCase;
}

@CopyWith()
@defJsonSerializable
class Address extends Equatable with ValidatorMixin {
  @CopyWithField.immutable()
  final String addressId;
  final String houseNo;
  final JSON_1 state;
  final JSON_1 country;

  final String postalCode;
  final GeoCoordinate? geoCoordinate;
  final PersonName? personName;
  final PhoneNumber? phoneNumber;
  final Email? email;
  final String? city;
  final String? area;
  final String? landmark;
  final int? floorLevel;
  final String? district;
  // also known as global_code
  final String? plusCode;
  final AddressType? type;

  @CopyWithField.immutable()
  final DateTime createdAt;
  @CopyWithField.removable()
  final DateTime lastUpdateAt; // not added into props

  Address({
    String? addressId,
    required this.houseNo,
    required this.state,
    required this.country,
    required this.postalCode,
    this.plusCode,
    this.geoCoordinate,
    this.personName,
    this.phoneNumber,
    this.email,
    this.landmark,
    this.city,
    this.area,
    this.floorLevel,
    this.district,
    this.type,
    DateTime? lastUpdateAt,
    DateTime? createdAt,
  })  : addressId = addressId ?? const Uuid().v4(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

  String get formattedAddress {
    var set = {houseNo, area, city, state.value, postalCode, country.value}..remove(null);
    return set.join(', ');
  }

  factory Address.fromJson(JSON json) => _$AddressFromJson(json);

  JSON toJson() => _$AddressToJson(this);

  @override
  void validator() {
    if (houseNo.isBlank) throw ArgumentError('Must be non-empty and null.', 'HouseNo');
    if (type == null) throw ArgumentError('Must be non-empty and null.', 'AddressType');

    if (floorLevel == null || floorLevel! < -10 || floorLevel! > 200) {
      throw ArgumentError('Valid floorLevel values typically range from -10 to 200', 'floorLevel');
    }
    if (geoCoordinate != null && geoCoordinate!.lat < -90 ||
        geoCoordinate!.lat > 90 ||
        geoCoordinate!.lng < -180 ||
        geoCoordinate!.lng > 180) {
      throw ArgumentError(
          'Valid latitude values typically range from -90 to 90, while valid longitude values range from -180 to 180',
          'geoCoordinate');
    }

    postalCode.regNotMatch(regPatterns.postalCode(), throwError: true);
    plusCode?.regNotMatch(regPatterns.googlePlusCode, throwError: true);
    email?.validator();
    phoneNumber?.validator();
    personName?.validator();
  }

  @override
  List<Object?> get props => [
        addressId,
        houseNo,
        state,
        country,
        personName,
        plusCode,
        geoCoordinate,
        phoneNumber,
        landmark,
        city,
        area,
        floorLevel,
        district,
        type,
        email,
        createdAt,
        // ignore lastUpdateAt
      ];
}
