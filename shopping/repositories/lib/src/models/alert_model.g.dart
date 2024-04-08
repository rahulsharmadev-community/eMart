// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertModel _$AlertModelFromJson(Map<String, dynamic> json) => AlertModel(
      content: AlertContent.fromJson(json['content'] as Map<String, dynamic>),
      backgroundColor:
          const ColorConverter().fromJson(json['backgroundColor'] as String?),
      expiry: const DateTimeConverter().fromJson(json['expiry'] as int),
      border: json['border'] as bool? ?? false,
      prefixIcon: json['prefixIcon'] == null
          ? null
          : IconModel.fromJson(json['prefixIcon'] as Map<String, dynamic>),
      showCloseButton: json['showCloseButton'] as bool? ?? true,
      decoration: json['decoration'] as bool? ?? false,
    );

Map<String, dynamic> _$AlertModelToJson(AlertModel instance) =>
    <String, dynamic>{
      'content': instance.content.toJson(),
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
      'prefixIcon': instance.prefixIcon?.toJson(),
      'showCloseButton': instance.showCloseButton,
      'expiry': const DateTimeConverter().toJson(instance.expiry),
      'decoration': instance.decoration,
      'border': instance.border,
    };

AlertButton _$AlertButtonFromJson(Map<String, dynamic> json) => AlertButton(
      text: json['text'] as String?,
      imageUrl: json['imageUrl'] as String?,
      textColor: const ColorConverter().fromJson(json['textColor'] as String?),
      backgroundColor:
          const ColorConverter().fromJson(json['backgroundColor'] as String?),
      isOutlineButton: json['isOutlineButton'] as bool? ?? false,
      returnOnPressed: json['returnOnPressed'] as String?,
    );

Map<String, dynamic> _$AlertButtonToJson(AlertButton instance) =>
    <String, dynamic>{
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'textColor': const ColorConverter().toJson(instance.textColor),
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
      'returnOnPressed': instance.returnOnPressed,
      'isOutlineButton': instance.isOutlineButton,
    };

IconModel _$IconModelFromJson(Map<String, dynamic> json) => IconModel(
      color: const ColorConverter().fromJson(json['color'] as String?),
      codePoint: json['codePoint'] as int,
      fontFamily: json['fontFamily'] as String?,
    );

Map<String, dynamic> _$IconModelToJson(IconModel instance) => <String, dynamic>{
      'codePoint': instance.codePoint,
      'color': const ColorConverter().toJson(instance.color),
      'fontFamily': instance.fontFamily,
    };

AlertContent _$AlertContentFromJson(Map<String, dynamic> json) => AlertContent(
      text: json['text'] as String?,
      imageUrl: json['imageUrl'] as String?,
      textColor: const ColorConverter().fromJson(json['textColor'] as String?),
      maxLines: json['maxLines'] as int?,
      isMarquee: json['isMarquee'] as bool? ?? false,
      buttonAlignment: $enumDecodeNullable(
          _$MainAxisAlignmentEnumMap, json['buttonAlignment']),
      buttons: (json['buttons'] as List<dynamic>?)
          ?.map((e) => AlertButton.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlertContentToJson(AlertContent instance) =>
    <String, dynamic>{
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'textColor': const ColorConverter().toJson(instance.textColor),
      'isMarquee': instance.isMarquee,
      'maxLines': instance.maxLines,
      'buttons': instance.buttons?.map((e) => e.toJson()).toList(),
      'buttonAlignment': _$MainAxisAlignmentEnumMap[instance.buttonAlignment],
    };

const _$MainAxisAlignmentEnumMap = {
  MainAxisAlignment.start: 'start',
  MainAxisAlignment.end: 'end',
  MainAxisAlignment.center: 'center',
  MainAxisAlignment.spaceBetween: 'spaceBetween',
  MainAxisAlignment.spaceAround: 'spaceAround',
  MainAxisAlignment.spaceEvenly: 'spaceEvenly',
};
