import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jars/jars.dart';

part 'keyword.g.dart';

typedef Keywords = List<Keyword>;

@CopyWith()
@JsonSerializable()
class Keyword extends Equatable {
  final String label;
  final String? image;

  @JsonKey(ignore: true)
  final DateTime lastSearchedAt;

  Keyword({
    required this.label,
    this.image,
    DateTime? lastSearchedAt,
  }) : lastSearchedAt = lastSearchedAt ?? DateTime.now();

  @override
  String toString() => "Keyword(label: $label,image: $image,lastSearchedAt: $lastSearchedAt)";

  factory Keyword.fromJson(JSON json) => _$KeywordFromJson(json);

  JSON toJson() => _$KeywordToJson(this);

  @override
  List<Object?> get props => [label];
}
