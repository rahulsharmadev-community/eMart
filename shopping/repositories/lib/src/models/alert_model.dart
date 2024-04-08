import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repositories/src/utils/json_converters.dart';

part 'alert_model.g.dart';

@defJsonSerializable
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

  factory AlertModel.fromJson(Map<String, dynamic> json) => _$AlertModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlertModelToJson(this);
}

@defJsonSerializable
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

  factory AlertButton.fromJson(Map<String, dynamic> json) => _$AlertButtonFromJson(json);

  Map<String, dynamic> toJson() => _$AlertButtonToJson(this);
}

@defJsonSerializable
class IconModel {
  final int codePoint;
  final Color? color;
  final String? fontFamily;
  IconModel({
    this.color,
    required this.codePoint,
    this.fontFamily,
  });

  factory IconModel.fromJson(Map<String, dynamic> json) => _$IconModelFromJson(json);

  Map<String, dynamic> toJson() => _$IconModelToJson(this);
}

@defJsonSerializable
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

  factory AlertContent.fromJson(Map<String, dynamic> json) => _$AlertContentFromJson(json);

  Map<String, dynamic> toJson() => _$AlertContentToJson(this);
}
