// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KeywordCWProxy {
  Keyword label(String label);

  Keyword image(String? image);

  Keyword lastSearchedAt(DateTime? lastSearchedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Keyword(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Keyword(...).copyWith(id: 12, name: "My name")
  /// ````
  Keyword call({
    String? label,
    String? image,
    DateTime? lastSearchedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKeyword.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKeyword.copyWith.fieldName(...)`
class _$KeywordCWProxyImpl implements _$KeywordCWProxy {
  const _$KeywordCWProxyImpl(this._value);

  final Keyword _value;

  @override
  Keyword label(String label) => this(label: label);

  @override
  Keyword image(String? image) => this(image: image);

  @override
  Keyword lastSearchedAt(DateTime? lastSearchedAt) =>
      this(lastSearchedAt: lastSearchedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Keyword(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Keyword(...).copyWith(id: 12, name: "My name")
  /// ````
  Keyword call({
    Object? label = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? lastSearchedAt = const $CopyWithPlaceholder(),
  }) {
    return Keyword(
      label: label == const $CopyWithPlaceholder() || label == null
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      lastSearchedAt: lastSearchedAt == const $CopyWithPlaceholder()
          ? _value.lastSearchedAt
          // ignore: cast_nullable_to_non_nullable
          : lastSearchedAt as DateTime?,
    );
  }
}

extension $KeywordCopyWith on Keyword {
  /// Returns a callable class that can be used as follows: `instanceOfKeyword.copyWith(...)` or like so:`instanceOfKeyword.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KeywordCWProxy get copyWith => _$KeywordCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Keyword _$KeywordFromJson(Map<String, dynamic> json) => Keyword(
      label: json['label'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$KeywordToJson(Keyword instance) => <String, dynamic>{
      'label': instance.label,
      'image': instance.image,
    };
