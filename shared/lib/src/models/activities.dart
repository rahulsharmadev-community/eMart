import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/jars.dart';
import 'package:shared/src/json_converters.dart';

part 'activities.g.dart';

@CopyWith(skipFields: true)
@defJsonSerializable
class Activities {
  final int sold;
  final int reach;
  final int views;
  const Activities([this.sold = 0, this.reach = 0, this.views = 0]);

  factory Activities.fromJson(JSON json) => _$ActivitiesFromJson(json);
  JSON toJson() => _$ActivitiesToJson(this);
}
