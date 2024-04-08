import 'package:banner/com.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

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

  factory LiveCountdownModel.fromJson(Map<String, dynamic> json) {
    return LiveCountdownModel(
        target: DateTime.fromMillisecondsSinceEpoch(json['target']),
        height: json['height'],
        backgroundColor: ifNotNull(json['backgroundColor'] as String?, (_) => _.toColor),
        imageUrl: json['imageUrl'],
        returnOnDone: json['returnOnDone']);
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'target': target.millisecondsSinceEpoch,
        'height': height,
        'backgroundColor': backgroundColor?.toHex,
        'imageUrl': imageUrl,
        'returnOnDone': returnOnDone,
      };
}
