// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmetadata.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MonthlyActivitiesCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MonthlyActivities(...).copyWith(id: 12, name: "My name")
  /// ````
  MonthlyActivities call({
    int? bought,
    int? reach,
    int? views,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMonthlyActivities.copyWith(...)`.
class _$MonthlyActivitiesCWProxyImpl implements _$MonthlyActivitiesCWProxy {
  const _$MonthlyActivitiesCWProxyImpl(this._value);

  final MonthlyActivities _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// MonthlyActivities(...).copyWith(id: 12, name: "My name")
  /// ````
  MonthlyActivities call({
    Object? bought = const $CopyWithPlaceholder(),
    Object? reach = const $CopyWithPlaceholder(),
    Object? views = const $CopyWithPlaceholder(),
  }) {
    return MonthlyActivities(
      bought == const $CopyWithPlaceholder() || bought == null
          ? _value.bought
          // ignore: cast_nullable_to_non_nullable
          : bought as int,
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

extension $MonthlyActivitiesCopyWith on MonthlyActivities {
  /// Returns a callable class that can be used as follows: `instanceOfMonthlyActivities.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$MonthlyActivitiesCWProxy get copyWith =>
      _$MonthlyActivitiesCWProxyImpl(this);
}

abstract class _$ProductMetaDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ProductMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductMetaData call({
    int? star1,
    int? star2,
    int? star3,
    int? star4,
    int? star5,
    int? totalReviews,
    Map<String, MonthlyActivities>? monthlyActivities,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductMetaData.copyWith(...)`.
class _$ProductMetaDataCWProxyImpl implements _$ProductMetaDataCWProxy {
  const _$ProductMetaDataCWProxyImpl(this._value);

  final ProductMetaData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// ProductMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductMetaData call({
    Object? star1 = const $CopyWithPlaceholder(),
    Object? star2 = const $CopyWithPlaceholder(),
    Object? star3 = const $CopyWithPlaceholder(),
    Object? star4 = const $CopyWithPlaceholder(),
    Object? star5 = const $CopyWithPlaceholder(),
    Object? totalReviews = const $CopyWithPlaceholder(),
    Object? monthlyActivities = const $CopyWithPlaceholder(),
  }) {
    return ProductMetaData(
      star1 == const $CopyWithPlaceholder() || star1 == null
          ? _value.star1
          // ignore: cast_nullable_to_non_nullable
          : star1 as int,
      star2 == const $CopyWithPlaceholder() || star2 == null
          ? _value.star2
          // ignore: cast_nullable_to_non_nullable
          : star2 as int,
      star3 == const $CopyWithPlaceholder() || star3 == null
          ? _value.star3
          // ignore: cast_nullable_to_non_nullable
          : star3 as int,
      star4 == const $CopyWithPlaceholder() || star4 == null
          ? _value.star4
          // ignore: cast_nullable_to_non_nullable
          : star4 as int,
      star5 == const $CopyWithPlaceholder() || star5 == null
          ? _value.star5
          // ignore: cast_nullable_to_non_nullable
          : star5 as int,
      totalReviews == const $CopyWithPlaceholder() || totalReviews == null
          ? _value.totalReviews
          // ignore: cast_nullable_to_non_nullable
          : totalReviews as int,
      monthlyActivities == const $CopyWithPlaceholder() ||
              monthlyActivities == null
          ? _value.monthlyActivities
          // ignore: cast_nullable_to_non_nullable
          : monthlyActivities as Map<String, MonthlyActivities>,
    );
  }
}

extension $ProductMetaDataCopyWith on ProductMetaData {
  /// Returns a callable class that can be used as follows: `instanceOfProductMetaData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductMetaDataCWProxy get copyWith => _$ProductMetaDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyActivities _$MonthlyActivitiesFromJson(Map<String, dynamic> json) =>
    MonthlyActivities(
      json['bought'] as int? ?? 0,
      json['reach'] as int? ?? 0,
      json['views'] as int? ?? 0,
    );

Map<String, dynamic> _$MonthlyActivitiesToJson(MonthlyActivities instance) =>
    <String, dynamic>{
      'bought': instance.bought,
      'reach': instance.reach,
      'views': instance.views,
    };

ProductMetaData _$ProductMetaDataFromJson(Map<String, dynamic> json) =>
    ProductMetaData(
      json['star1'] as int? ?? 0,
      json['star2'] as int? ?? 0,
      json['star3'] as int? ?? 0,
      json['star4'] as int? ?? 0,
      json['star5'] as int? ?? 0,
      json['totalReviews'] as int? ?? 0,
      (json['monthlyActivities'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, MonthlyActivities.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$ProductMetaDataToJson(ProductMetaData instance) =>
    <String, dynamic>{
      'star1': instance.star1,
      'star2': instance.star2,
      'star3': instance.star3,
      'star4': instance.star4,
      'star5': instance.star5,
      'totalReviews': instance.totalReviews,
      'monthlyActivities':
          instance.monthlyActivities.map((k, e) => MapEntry(k, e.toJson())),
    };
