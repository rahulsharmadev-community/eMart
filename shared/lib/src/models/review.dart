import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/src/json_converters.dart';
import 'package:uuid/uuid.dart';
import 'package:jars/jars.dart';
part 'review.g.dart';

@CopyWith()
@defJsonSerializable
class Review {
  Review({
    String? reviewId,
    this.title,
    this.text,
    required this.rating,
    required this.reviewedBy,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
    this.imageUrls = const [],
  })  : reviewId = reviewId ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @CopyWithField.immutable()
  final String reviewId;

  /// User name of the reviewer.
  @CopyWithField.immutable()
  final String reviewedBy;

  /// Title of the review.
  final String? title;

  /// List of URLs for images associated with the review.
  final List<String> imageUrls;

  /// Text content of the review.
  final String? text;

  /// Rating given by the reviewer (typically on a scale of 1 to 5).
  final double rating;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Review.fromJson(JSON json) => _$ReviewFromJson(json);
  JSON toJson() => _$ReviewToJson(this);
}
