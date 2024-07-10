import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/regpatterns.dart';
import 'package:shared/src/json_converters.dart';
import 'package:uuid/uuid.dart';
import 'package:jars/jars_core.dart';
part 'review.g.dart';

@CopyWith()
@defJsonSerializable
class Review with ValidatorMixin {
  Review({
    String? reviewId,
    required this.title,
    this.text,
    this.rating,
    this.reviewedBy,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
    this.imageUrls,
  })  : reviewId = reviewId ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @override
  void validator() {
    if (rating == null || rating! < 0 || rating! > 5) {
      throw ArgumentError('Rating must be between 0 and 5.');
    }
    if (reviewedBy?.isEmpty ?? true) {
      throw ArgumentError('Reviewed by cannot be empty.');
    }
    if (text?.isBlank ?? true) {
      throw ArgumentError('Text cannot be empty.');
    }
    if (title.isBlank) {
      throw ArgumentError('Title cannot be empty.');
    }
    imageUrls?.any((url) => !url.regMatch(regPatterns.url, throwError: true));
  }

  @CopyWithField.immutable()
  final String reviewId;

  /// User name of the reviewer.
  @CopyWithField.immutable()
  final String? reviewedBy;

  /// Title of the review.
  final String title;

  /// List of URLs for images associated with the review.
  final List<String>? imageUrls;

  /// Text content of the review.
  final String? text;

  /// Rating given by the reviewer (typically on a scale of 1 to 5).
  final double? rating;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Review.fromJson(JSON json) => _$ReviewFromJson(json);
  JSON toJson() => _$ReviewToJson(this);
}
