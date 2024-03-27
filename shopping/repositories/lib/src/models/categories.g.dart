// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoriesCWProxy {
  Categories label(String label);

  Categories subcategory(List<Subcategory> subcategory);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Categories(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Categories(...).copyWith(id: 12, name: "My name")
  /// ````
  Categories call({
    String? label,
    List<Subcategory>? subcategory,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategories.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategories.copyWith.fieldName(...)`
class _$CategoriesCWProxyImpl implements _$CategoriesCWProxy {
  const _$CategoriesCWProxyImpl(this._value);

  final Categories _value;

  @override
  Categories label(String label) => this(label: label);

  @override
  Categories subcategory(List<Subcategory> subcategory) =>
      this(subcategory: subcategory);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Categories(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Categories(...).copyWith(id: 12, name: "My name")
  /// ````
  Categories call({
    Object? label = const $CopyWithPlaceholder(),
    Object? subcategory = const $CopyWithPlaceholder(),
  }) {
    return Categories(
      label: label == const $CopyWithPlaceholder() || label == null
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
      subcategory:
          subcategory == const $CopyWithPlaceholder() || subcategory == null
              ? _value.subcategory
              // ignore: cast_nullable_to_non_nullable
              : subcategory as List<Subcategory>,
    );
  }
}

extension $CategoriesCopyWith on Categories {
  /// Returns a callable class that can be used as follows: `instanceOfCategories.copyWith(...)` or like so:`instanceOfCategories.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoriesCWProxy get copyWith => _$CategoriesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      label: json['label'] as String,
      subcategory: (json['subcategory'] as List<dynamic>)
          .map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'label': instance.label,
      'subcategory': instance.subcategory.map((e) => e.toJson()).toList(),
    };

Subcategory _$SubcategoryFromJson(Map<String, dynamic> json) => Subcategory(
      title: json['title'] as String,
      iconImg: json['iconImg'] as String,
      bannerImg: json['bannerImg'] as String,
      leaderboardImg: json['leaderboardImg'] as String,
    );

Map<String, dynamic> _$SubcategoryToJson(Subcategory instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iconImg': instance.iconImg,
      'bannerImg': instance.bannerImg,
      'leaderboardImg': instance.leaderboardImg,
    };
