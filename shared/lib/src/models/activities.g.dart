// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActivitiesCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Activities(...).copyWith(id: 12, name: "My name")
  /// ````
  Activities call({
    int? sold,
    int? reach,
    int? views,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActivities.copyWith(...)`.
class _$ActivitiesCWProxyImpl implements _$ActivitiesCWProxy {
  const _$ActivitiesCWProxyImpl(this._value);

  final Activities _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// Activities(...).copyWith(id: 12, name: "My name")
  /// ````
  Activities call({
    Object? sold = const $CopyWithPlaceholder(),
    Object? reach = const $CopyWithPlaceholder(),
    Object? views = const $CopyWithPlaceholder(),
  }) {
    return Activities(
      sold == const $CopyWithPlaceholder() || sold == null
          ? _value.sold
          // ignore: cast_nullable_to_non_nullable
          : sold as int,
      reach == const $CopyWithPlaceholder() || reach == null
          ? _value.reach
          // ignore: cast_nullable_to_non_nullable
          : reach as int,
      views == const $CopyWithPlaceholder() || views == null
          ? _value.views
          // ignore: cast_nullable_to_non_nullable
          : views as int,
    );
  }
}

extension $ActivitiesCopyWith on Activities {
  /// Returns a callable class that can be used as follows: `instanceOfActivities.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ActivitiesCWProxy get copyWith => _$ActivitiesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activities _$ActivitiesFromJson(Map<String, dynamic> json) => Activities(
      json['sold'] as int? ?? 0,
      json['reach'] as int? ?? 0,
      json['views'] as int? ?? 0,
    );

Map<String, dynamic> _$ActivitiesToJson(Activities instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'reach': instance.reach,
      'views': instance.views,
    };
