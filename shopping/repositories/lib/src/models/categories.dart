import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/jars.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Categories {
  final String title, iconImg;
  final List<String> categories;

  Categories({
    required this.title,
    required this.iconImg,
    required this.categories,
  });
  factory Categories.fromJson(JSON json) => _$CategoriesFromJson(json);

  JSON toJson() => _$CategoriesToJson(this);
}

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Category {
  @CopyWithField.immutable()
  final String id;
  @CopyWithField.immutable()
  final String title;
  final String? iconImg, bannerImg, leaderboardImg;
  final List<String> relatedCategories;
  @CopyWithField.immutable()
  final DateTime expiry;
  final DateTime lastUpdate;

  Category({
    required this.title,
    required this.id,
    this.iconImg,
    this.bannerImg,
    this.leaderboardImg,
    this.relatedCategories = const [],
    DateTime? lastUpdate,
  })  : expiry = DateTime.now().add(4.hours),
        lastUpdate = lastUpdate ?? DateTime.now();
  factory Category.fromJson(JSON json) => _$CategoryFromJson(json);

  JSON toJson() => _$CategoryToJson(this);
}
