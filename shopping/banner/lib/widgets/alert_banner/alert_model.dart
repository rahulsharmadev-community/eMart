import 'package:banner/com.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:uuid/uuid.dart';

class AlertModel {
  final AlertContent content;
  final Color? backgroundColor;
  final IconModel? prefixIcon;
  final bool? showCloseButton;
  final DateTime expiry;
  final bool decoration;
  final bool border;

  AlertModel(
      {required this.content,
      this.backgroundColor,
      required this.expiry,
      this.border = false,
      this.prefixIcon,
      this.showCloseButton = true,
      this.decoration = false});

  factory AlertModel.fromJson(Map<String, dynamic> json) => AlertModel(
        border: json['border'] ?? false,
        decoration: json['decoration'] ?? false,
        showCloseButton: json['showCloseButton'] ?? true,
        prefixIcon: json['prefixIcon'] == null
            ? null
            : IconModel.fromJson(json['prefixIcon'] as Map<String, dynamic>),
        expiry: DateTime.fromMillisecondsSinceEpoch(json['expiry']),
        backgroundColor: json['backgroundColor'] == null ? null : (json['backgroundColor'] as String).toColor,
        content: AlertContent.fromJson(json['content'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'decoration': decoration,
        'border': border,
        'prefixIcon': prefixIcon?.toJson(),
        'showCloseButton': showCloseButton,
        'backgroundColor': backgroundColor?.toHex,
        'expiry': expiry.millisecondsSinceEpoch
      };
}

class AlertButton {
  final String? text;
  final String? imageUrl;
  final Color? textColor;
  final Color? backgroundColor;
  final String? returnOnPressed;
  final bool isOutlineButton;

  AlertButton({
    this.text,
    this.imageUrl,
    this.textColor,
    this.backgroundColor,
    this.isOutlineButton = false,
    this.returnOnPressed,
  });

  factory AlertButton.fromJson(Map<String, dynamic> json) => AlertButton(
      text: json['text'],
      imageUrl: json['imageUrl'],
      returnOnPressed: json['returnOnPressed'],
      textColor: ifNotNull(json['textColor'] as String?, (_) => _.toColor),
      backgroundColor: ifNotNull(json['backgroundColor'] as String?, (_) => _.toColor),
      isOutlineButton: json['isOutlineButton'] ?? false);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'imageUrl': imageUrl,
        'textColor': textColor?.toHex,
        'backgroundColor': backgroundColor?.toHex,
        'isOutlineButton': isOutlineButton,
        'returnOnPressed': returnOnPressed
      };
}

class IconModel {
  final int codePoint;
  final Color? color;
  final String? fontFamily;
  IconModel({
    this.color,
    required this.codePoint,
    this.fontFamily,
  });

  factory IconModel.fromJson(Map<String, dynamic> json) {
    return IconModel(
      codePoint: json['codePoint'] as int,
      color: ifNotNull(json['color'] as String?, (_) => _.toColor),
      fontFamily: json['fontFamily'] as String?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'codePoint': codePoint,
        'color': color?.toHex,
        'fontFamily': fontFamily,
      };
}

class AlertContent {
  final String? text;
  final String? imageUrl;
  final Color? textColor;
  final bool isMarquee;
  final int? maxLines;
  final List<AlertButton>? buttons;
  final MainAxisAlignment? buttonAlignment;

  AlertContent(
      {this.text,
      this.imageUrl,
      this.textColor,
      this.maxLines,
      this.isMarquee = false,
      this.buttonAlignment,
      this.buttons});

  bool get isOnyImage => imageUrl != null && text == null;

  factory AlertContent.fromJson(Map<String, dynamic> json) => AlertContent(
      text: json['text'],
      imageUrl: json['imageUrl'],
      maxLines: json['maxLines'],
      isMarquee: json['isMarquee'] ?? false,
      textColor: json['textColor'] == null ? null : (json['textColor'] as String).toColor,
      buttons:
          ifNotNull(json['buttons'] as List<dynamic>?, (_) => _.map((e) => AlertButton.fromJson(e)).toList()),
      buttonAlignment:
          json['buttonAlignment'] == null ? null : MainAxisAlignment.values[json['buttonAlignment']]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'isMarquee': isMarquee,
        'maxLines': maxLines,
        'imageUrl': imageUrl,
        'textColor': textColor?.toHex,
        'buttonAlignment': buttonAlignment?.index,
        'buttons': buttons?.map((e) => e.toJson()).toList()
      };
}