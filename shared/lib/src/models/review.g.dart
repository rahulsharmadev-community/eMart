// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReviewCWProxy {
  Review title(String? title);

  Review text(String? text);

  Review rating(int rating);

  Review imageUrls(List<String> imageUrls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Review(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Review(...).copyWith(id: 12, name: "My name")
  /// ````
  Review call({
    String? title,
    String? text,
    int? rating,
    List<String>? imageUrls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReview.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReview.copyWith.fieldName(...)`
class _$ReviewCWProxyImpl implements _$ReviewCWProxy {
  const _$ReviewCWProxyImpl(this._value);

  final Review _value;

  @override
  Review title(String? title) => this(title: title);

  @override
  Review text(String? text) => this(text: text);

  @override
  Review rating(int rating) => this(rating: rating);

  @override
  Review imageUrls(List<String> imageUrls) => this(imageUrls: imageUrls);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Review(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Review(...).copyWith(id: 12, name: "My name")
  /// ````
  Review call({
    Object? title = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? imageUrls = const $CopyWithPlaceholder(),
  }) {
    return Review(
      reviewId: _value.reviewId,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
      rating: rating == const $CopyWithPlaceholder() || rating == null
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int,
      reviewedBy: _value.reviewedBy,
      createdAt: _value.createdAt,
      imageUrls: imageUrls == const $CopyWithPlaceholder() || imageUrls == null
          ? _value.imageUrls
          // ignore: cast_nullable_to_non_nullable
          : imageUrls as List<String>,
    );
  }
}

extension $ReviewCopyWith on Review {
  /// Returns a callable class that can be used as follows: `instanceOfReview.copyWith(...)` or like so:`instanceOfReview.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReviewCWProxy get copyWith => _$ReviewCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      reviewId: json['reviewId'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      rating: json['rating'] as int,
      reviewedBy: json['reviewedBy'] as String,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'reviewId': instance.reviewId,
      'reviewedBy': instance.reviewedBy,
      'title': instance.title,
      'imageUrls': instance.imageUrls,
      'text': instance.text,
      'rating': instance.rating,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
