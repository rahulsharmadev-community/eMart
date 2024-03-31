import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';

part 'appmetadata.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class AppMetaData {
  final List<String> publicCategories;
  final List<Categories> categories;

  @CopyWithField.immutable()
  final DateTime expiry;

  AppMetaData(this.categories, this.publicCategories) : expiry = DateTime.now().add(24.hours);

  factory AppMetaData.fromJson(JSON json) => _$AppMetaDataFromJson(json);

  JSON toJson() => _$AppMetaDataToJson(this);
}
