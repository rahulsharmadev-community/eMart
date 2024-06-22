import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:jars/jars.dart';
import '/src/utils/json_converters.dart';

part 'user_activity.g.dart';

@CopyWith()
@defJsonSerializable
class UserActivity extends Equatable {
  final List<String> visitedProducts;
  final List<String> suggestionKeywords;

  const UserActivity({List<String>? visitedProducts, List<String>? suggestionKeywords})
      : visitedProducts = visitedProducts ?? const [],
        suggestionKeywords = suggestionKeywords ?? const [];

  factory UserActivity.fromJson(JSON json) => _$UserActivityFromJson(json);

  JSON toJson() => _$UserActivityToJson(this);

  @override
  List<Object?> get props => [visitedProducts, suggestionKeywords];
}
