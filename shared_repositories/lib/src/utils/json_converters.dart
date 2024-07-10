import 'package:flutter/material.dart';
import 'package:jars/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
export 'package:json_annotation/json_annotation.dart';

class ColorConverter implements JsonConverter<Color?, String?> {
  const ColorConverter();

  @override
  Color? fromJson(String? json) => json?.toColor;

  @override
  String? toJson(Color? object) => object?.toHex;
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

const defJsonSerializable = JsonSerializable(
  explicitToJson: true,
  converters: [
    ColorConverter(),
    DateTimeConverter(),
  ],
);

extension JsonSerializableExt on JsonSerializable {
  JsonSerializable copyWith(
          bool? nullable,
          bool? anyMap,
          bool? checked,
          String? constructor,
          bool? createFieldMap,
          bool? createFactory,
          bool? createToJson,
          bool? disallowUnrecognizedKeys,
          bool? explicitToJson,
          FieldRename? fieldRename,
          bool? ignoreUnannotated,
          bool? includeIfNull,
          List<JsonConverter<dynamic, dynamic>>? converters,
          bool? genericArgumentFactories,
          bool? createPerFieldToJson) =>
      JsonSerializable(
        anyMap: anyMap ?? this.anyMap,
        checked: checked ?? this.checked,
        constructor: constructor ?? this.constructor,
        createFieldMap: createFieldMap ?? this.createFieldMap,
        createFactory: createFactory ?? this.createFactory,
        createToJson: createToJson ?? this.createToJson,
        disallowUnrecognizedKeys: disallowUnrecognizedKeys ?? this.disallowUnrecognizedKeys,
        explicitToJson: explicitToJson ?? this.explicitToJson,
        fieldRename: fieldRename ?? this.fieldRename,
        ignoreUnannotated: ignoreUnannotated ?? this.ignoreUnannotated,
        includeIfNull: includeIfNull ?? this.includeIfNull,
        converters: converters ?? this.converters,
        genericArgumentFactories: genericArgumentFactories ?? this.genericArgumentFactories,
        createPerFieldToJson: createPerFieldToJson ?? this.createPerFieldToJson,
      );
}
