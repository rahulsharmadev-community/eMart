// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'durationperiod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DurationPeriod _$DurationPeriodFromJson(Map<String, dynamic> json) =>
    DurationPeriod._(
      (json['duration'] as num).toInt(),
      json['durationType'] as String,
    );

Map<String, dynamic> _$DurationPeriodToJson(DurationPeriod instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'durationType': instance.durationType,
    };
