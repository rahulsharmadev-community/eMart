// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_countdown_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LiveCountdownModelCWProxy {
  LiveCountdownModel target(DateTime target);

  LiveCountdownModel height(double height);

  LiveCountdownModel backgroundColor(Color? backgroundColor);

  LiveCountdownModel imageUrl(String? imageUrl);

  LiveCountdownModel returnOnDone(String? returnOnDone);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LiveCountdownModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LiveCountdownModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LiveCountdownModel call({
    DateTime? target,
    double? height,
    Color? backgroundColor,
    String? imageUrl,
    String? returnOnDone,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLiveCountdownModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLiveCountdownModel.copyWith.fieldName(...)`
class _$LiveCountdownModelCWProxyImpl implements _$LiveCountdownModelCWProxy {
  const _$LiveCountdownModelCWProxyImpl(this._value);

  final LiveCountdownModel _value;

  @override
  LiveCountdownModel target(DateTime target) => this(target: target);

  @override
  LiveCountdownModel height(double height) => this(height: height);

  @override
  LiveCountdownModel backgroundColor(Color? backgroundColor) =>
      this(backgroundColor: backgroundColor);

  @override
  LiveCountdownModel imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  LiveCountdownModel returnOnDone(String? returnOnDone) =>
      this(returnOnDone: returnOnDone);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LiveCountdownModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LiveCountdownModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LiveCountdownModel call({
    Object? target = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? backgroundColor = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? returnOnDone = const $CopyWithPlaceholder(),
  }) {
    return LiveCountdownModel(
      target: target == const $CopyWithPlaceholder() || target == null
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as DateTime,
      height: height == const $CopyWithPlaceholder() || height == null
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as double,
      backgroundColor: backgroundColor == const $CopyWithPlaceholder()
          ? _value.backgroundColor
          // ignore: cast_nullable_to_non_nullable
          : backgroundColor as Color?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      returnOnDone: returnOnDone == const $CopyWithPlaceholder()
          ? _value.returnOnDone
          // ignore: cast_nullable_to_non_nullable
          : returnOnDone as String?,
    );
  }
}

extension $LiveCountdownModelCopyWith on LiveCountdownModel {
  /// Returns a callable class that can be used as follows: `instanceOfLiveCountdownModel.copyWith(...)` or like so:`instanceOfLiveCountdownModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LiveCountdownModelCWProxy get copyWith =>
      _$LiveCountdownModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveCountdownModel _$LiveCountdownModelFromJson(Map<String, dynamic> json) =>
    LiveCountdownModel(
      target: const DateTimeConverter().fromJson(json['target'] as int),
      height: (json['height'] as num?)?.toDouble() ?? kToolbarHeight,
      backgroundColor:
          const ColorConverter().fromJson(json['backgroundColor'] as String?),
      imageUrl: json['imageUrl'] as String?,
      returnOnDone: json['returnOnDone'] as String?,
    );

Map<String, dynamic> _$LiveCountdownModelToJson(LiveCountdownModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'target': const DateTimeConverter().toJson(instance.target),
      'imageUrl': instance.imageUrl,
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
      'returnOnDone': instance.returnOnDone,
    };
