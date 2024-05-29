import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';
import 'package:jars/jars.dart';
import 'package:uuid/uuid.dart';

part 'address.g.dart';

enum AddressType {
  home(Icons.home_rounded),
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
class Address extends Equatable {
  @CopyWithField.immutable()
  final String addressId;
  final PersonName personName;
  final int phoneNumber;
  final String? email;
  final String houseNo;
  final JSON_1 state;
  final JSON_1 country;
  final int postalCode;
  final String? city;
  final String? area;
  final String? landmark;
  final int? floorLevel;
  final String? district;
  final GeoCoordinate geoCoordinate;
  // also known as global_code
  final String plusCode;
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
    required this.personName,
    required this.plusCode,
    required this.geoCoordinate,
    required this.phoneNumber,
    this.email,
    this.landmark,
    this.city,
    this.area,
    this.floorLevel,
    this.district,
    this.type,
    DateTime? lastUpdateAt,
    DateTime? createdAt,
  })  : assert(personName.firstName.isNotEmpty, 'name should not be empty.'),
        addressId = addressId ?? const Uuid().v4(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

  bool get isNotEmpty => !houseNo.isBlank && !plusCode.isBlank && floorLevel != null;

  String get formattedAddress {
    var set = {houseNo, area, city, state.value, postalCode, country.value}..remove(null);
    return set.join(', ');
  }

  static final empty = Address(
    houseNo: '',
    state: (key: '', value: ''),
    country: (key: '', value: ''),
    postalCode: -1,
    personName: PersonName(firstName: '@empty'),
    plusCode: '',
    geoCoordinate: (lat: -1, lng: -1),
    phoneNumber: -1,
  );

  factory Address.fromJson(JSON json) => _$AddressFromJson(json);

  JSON toJson() => _$AddressToJson(this);

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
      ];
}
