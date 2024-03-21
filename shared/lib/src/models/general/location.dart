import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared/src/helper.dart';
import 'package:uuid/uuid.dart';
import 'typedef.dart';

part 'location.g.dart';

@CopyWith()
@defJson
class Location {
  Location({
    String? id,
    this.name,
    this.address,
    DateTime? createdAt,
    required this.coordinate,
  })  : createdAt = createdAt ?? DateTime.now(),
        id = id ?? const Uuid().v4();

  @CopyWithField.immutable()
  final String id;
  @CopyWithField.immutable()
  final DateTime createdAt;

  final GeoCoordinate coordinate;
  final String? name;
  final String? address;

  factory Location.fromJson(JSON json) => _$LocationFromJson(json);

  JSON toJson() => _$LocationToJson(this);
}
