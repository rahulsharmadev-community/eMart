import 'package:json_annotation/json_annotation.dart';
import 'package:shared/models.dart';

part 'durationperiod.g.dart';

@JsonSerializable(constructor: '_', explicitToJson: true)
class DurationPeriod {
  DurationPeriod._(this.duration, this.durationType);
  final int duration;
  final String durationType;

  // Check if the duration is zero.
  bool get isZero => duration == -1;

  // Check if the duration is a lifetime.
  bool get isLifeTime => duration == 100;

  // Factory method to create a zero-duration instance.
  factory DurationPeriod.zero() => DurationPeriod._(-1, 'day');

  // Factory method to create a lifetime-duration instance.
  factory DurationPeriod.lifeTime() => DurationPeriod._(100, 'year');

  // Factory method to create a specific duration in days.
  factory DurationPeriod.day(int day) => DurationPeriod._(day, 'day');

  // Factory method to create a specific duration in years.
  factory DurationPeriod.year(int year) => DurationPeriod._(year, 'year');

  factory DurationPeriod.fromJson(JSON json) => _$DurationPeriodFromJson(json);
  JSON toJson() => _$DurationPeriodToJson(this);

  @override
  String toString() =>
      duration == -1 ? 'Zero' : '${duration == 100 ? 'LifeTime ' : ''}$duration $durationType';
}
