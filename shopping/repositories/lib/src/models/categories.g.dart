// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoriesCWProxy {
  Categories title(String title);

  Categories iconImg(String iconImg);

  Categories categories(List<String> categories);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Categories(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Categories(...).copyWith(id: 12, name: "My name")
  /// ````
  Categories call({
    String? title,
    String? iconImg,
    List<String>? categories,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategories.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategories.copyWith.fieldName(...)`
class _$CategoriesCWProxyImpl implements _$CategoriesCWProxy {
  const _$CategoriesCWProxyImpl(this._value);

  final Categories _value;

  @override
  Categories title(String title) => this(title: title);

  @override
  Categories iconImg(String iconImg) => this(iconImg: iconImg);

  @override
  Categories categories(List<String> categories) =>
      this(categories: categories);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Categories(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Categories(...).copyWith(id: 12, name: "My name")
  /// ````
  Categories call({
    Object? title = const $CopyWithPlaceholder(),
    Object? iconImg = const $CopyWithPlaceholder(),
    Object? categories = const $CopyWithPlaceholder(),
  }) {
    return Categories(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      iconImg: iconImg == const $CopyWithPlaceholder() || iconImg == null
          ? _value.iconImg
          // ignore: cast_nullable_to_non_nullable
          : iconImg as String,
      categories:
          categories == const $CopyWithPlaceholder() || categories == null
              ? _value.categories
              // ignore: cast_nullable_to_non_nullable
              : categories as List<String>,
    );
  }
}

extension $CategoriesCopyWith on Categories {
  /// Returns a callable class that can be used as follows: `instanceOfCategories.copyWith(...)` or like so:`instanceOfCategories.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoriesCWProxy get copyWith => _$CategoriesCWProxyImpl(this);
}

abstract class _$CategoryCWProxy {
  Category iconImg(String? iconImg);

  Category bannerImg(String? bannerImg);

  Category leaderboardImg(String? leaderboardImg);

  Category relatedCategories(List<String> relatedCategories);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Category(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Category(...).copyWith(id: 12, name: "My name")
  /// ````
  Category call({
    String? iconImg,
    String? bannerImg,
    String? leaderboardImg,
    List<String>? relatedCategories,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategory.copyWith.fieldName(...)`
class _$CategoryCWProxyImpl implements _$CategoryCWProxy {
  const _$CategoryCWProxyImpl(this._value);

  final Category _value;

  @override
  Category iconImg(String? iconImg) => this(iconImg: iconImg);

  @override
  Category bannerImg(String? bannerImg) => this(bannerImg: bannerImg);

  @override
  Category leaderboardImg(String? leaderboardImg) =>
      this(leaderboardImg: leaderboardImg);

  @override
  Category relatedCategories(List<String> relatedCategories) =>
      this(relatedCategories: relatedCategories);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Category(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Category(...).copyWith(id: 12, name: "My name")
  /// ````
  Category call({
    Object? iconImg = const $CopyWithPlaceholder(),
    Object? bannerImg = const $CopyWithPlaceholder(),
    Object? leaderboardImg = const $CopyWithPlaceholder(),
    Object? relatedCategories = const $CopyWithPlaceholder(),
  }) {
    return Category(
      title: _value.title,
      id: _value.id,
      iconImg: iconImg == const $CopyWithPlaceholder()
          ? _value.iconImg
          // ignore: cast_nullable_to_non_nullable
          : iconImg as String?,
      bannerImg: bannerImg == const $CopyWithPlaceholder()
          ? _value.bannerImg
          // ignore: cast_nullable_to_non_nullable
          : bannerImg as String?,
      leaderboardImg: leaderboardImg == const $CopyWithPlaceholder()
          ? _value.leaderboardImg
          // ignore: cast_nullable_to_non_nullable
          : leaderboardImg as String?,
      relatedCategories: relatedCategories == const $CopyWithPlaceholder() ||
              relatedCategories == null
          ? _value.relatedCategories
          // ignore: cast_nullable_to_non_nullable
          : relatedCategories as List<String>,
    );
  }
}

extension $CategoryCopyWith on Category {
  /// Returns a callable class that can be used as follows: `instanceOfCategory.copyWith(...)` or like so:`instanceOfCategory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoryCWProxy get copyWith => _$CategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      title: json['title'] as String,
      iconImg: json['iconImg'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iconImg': instance.iconImg,
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      title: json['title'] as String,
      id: json['id'] as String,
      iconImg: json['iconImg'] as String?,
      bannerImg: json['bannerImg'] as String?,
      leaderboardImg: json['leaderboardImg'] as String?,
      relatedCategories: (json['relatedCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'iconImg': instance.iconImg,
      'bannerImg': instance.bannerImg,
      'leaderboardImg': instance.leaderboardImg,
      'relatedCategories': instance.relatedCategories,
    };
