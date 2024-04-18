import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:repositories/src/utils/json_converters.dart';

part 'live_countdown_model.g.dart';

textFrom(Map<String, dynamic> json) => json['backgroundColor'].ifNotNull(null, (_) => _.toColor);
textTo(LiveCountdownModel inst) => inst.backgroundColor?.toHex;

@CopyWith()
@defJsonSerializable
class LiveCountdownModel {
  final double height;
  final DateTime target;
  final String? imageUrl;
  final Color? backgroundColor;
  final String? returnOnDone;

  const LiveCountdownModel({
    required this.target,
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.imageUrl,
    this.returnOnDone,
  });

  factory LiveCountdownModel.fromJson(Map<String, dynamic> json) => _$LiveCountdownModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveCountdownModelToJson(this);
}
