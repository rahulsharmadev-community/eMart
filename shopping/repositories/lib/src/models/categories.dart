import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared/models.dart';

part 'categories.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Categories {
  String label;
  List<Subcategory> subcategory;

  Categories({
    required this.label,
    required this.subcategory,
  });
  factory Categories.fromJson(JSON json) => _$CategoriesFromJson(json);

  JSON toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class Subcategory {
  String title;
  String iconImg;
  String bannerImg;
  String leaderboardImg;

  Subcategory({
    required this.title,
    required this.iconImg,
    required this.bannerImg,
    required this.leaderboardImg,
  });
  factory Subcategory.fromJson(JSON json) => _$SubcategoryFromJson(json);

  JSON toJson() => _$SubcategoryToJson(this);
}
