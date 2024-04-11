import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/src/json_converters.dart';
import 'package:jars/jars.dart';
import 'location.dart';
import 'package:uuid/uuid.dart';
part 'address.g.dart';

@CopyWith()
@defJsonSerializable
class Address {
  @CopyWithField.immutable()
  final String addressId;

  final String houseNo;
  final String state;
  final String country;
  final String pincode;
  final String? city;
  final String? area;
  final int? floorLevel;
  final String? district;
  final Location? location;

  @CopyWithField.immutable()
  final DateTime? createdAt;
  @CopyWithField.removable()
  final DateTime? lastUpdateAt;

  Address({
    String? addressId,
    required this.houseNo,
    required this.state,
    required this.country,
    required this.pincode,
    this.city,
    this.area,
    this.floorLevel,
    this.district,
    this.location,
    DateTime? lastUpdateAt,
    DateTime? createdAt,
  })  : addressId = addressId ?? const Uuid().v4(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

  factory Address.fromJson(JSON json) => _$AddressFromJson(json);

  JSON toJson() => _$AddressToJson(this);
}
