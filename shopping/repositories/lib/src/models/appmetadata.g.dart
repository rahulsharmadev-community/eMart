// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appmetadata.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppMetaDataCWProxy {
  AppMetaData categories(List<Categories> categories);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppMetaData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  AppMetaData call({
    List<Categories>? categories,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppMetaData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppMetaData.copyWith.fieldName(...)`
class _$AppMetaDataCWProxyImpl implements _$AppMetaDataCWProxy {
  const _$AppMetaDataCWProxyImpl(this._value);

  final AppMetaData _value;

  @override
  AppMetaData categories(List<Categories> categories) =>
      this(categories: categories);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppMetaData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  AppMetaData call({
    Object? categories = const $CopyWithPlaceholder(),
  }) {
    return AppMetaData(
      categories == const $CopyWithPlaceholder() || categories == null
          ? _value.categories
          // ignore: cast_nullable_to_non_nullable
          : categories as List<Categories>,
    );
  }
}

extension $AppMetaDataCopyWith on AppMetaData {
  /// Returns a callable class that can be used as follows: `instanceOfAppMetaData.copyWith(...)` or like so:`instanceOfAppMetaData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppMetaDataCWProxy get copyWith => _$AppMetaDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppMetaData _$AppMetaDataFromJson(Map<String, dynamic> json) => AppMetaData(
      (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppMetaDataToJson(AppMetaData instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
