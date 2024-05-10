// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserActivityCWProxy {
  UserActivity visitedProducts(List<String> visitedProducts);

  UserActivity suggestionKeywords(List<String> suggestionKeywords);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserActivity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserActivity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserActivity call({
    List<String>? visitedProducts,
    List<String>? suggestionKeywords,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserActivity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserActivity.copyWith.fieldName(...)`
class _$UserActivityCWProxyImpl implements _$UserActivityCWProxy {
  const _$UserActivityCWProxyImpl(this._value);

  final UserActivity _value;

  @override
  UserActivity visitedProducts(List<String> visitedProducts) =>
      this(visitedProducts: visitedProducts);

  @override
  UserActivity suggestionKeywords(List<String> suggestionKeywords) =>
      this(suggestionKeywords: suggestionKeywords);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserActivity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserActivity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserActivity call({
    Object? visitedProducts = const $CopyWithPlaceholder(),
    Object? suggestionKeywords = const $CopyWithPlaceholder(),
  }) {
    return UserActivity(
      visitedProducts: visitedProducts == const $CopyWithPlaceholder() ||
              visitedProducts == null
          ? _value.visitedProducts
          // ignore: cast_nullable_to_non_nullable
          : visitedProducts as List<String>,
      suggestionKeywords: suggestionKeywords == const $CopyWithPlaceholder() ||
              suggestionKeywords == null
          ? _value.suggestionKeywords
          // ignore: cast_nullable_to_non_nullable
          : suggestionKeywords as List<String>,
    );
  }
}

extension $UserActivityCopyWith on UserActivity {
  /// Returns a callable class that can be used as follows: `instanceOfUserActivity.copyWith(...)` or like so:`instanceOfUserActivity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserActivityCWProxy get copyWith => _$UserActivityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserActivity _$UserActivityFromJson(Map<String, dynamic> json) => UserActivity(
      visitedProducts: (json['visitedProducts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      suggestionKeywords: (json['suggestionKeywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserActivityToJson(UserActivity instance) =>
    <String, dynamic>{
      'visitedProducts': instance.visitedProducts,
      'suggestionKeywords': instance.suggestionKeywords,
    };
