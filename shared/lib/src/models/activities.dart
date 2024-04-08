import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars_core/jars_core.dart';
import 'package:shared/src/helper.dart';

 part 'activities.g.dart';

@CopyWith(skipFields: true)
@defJson
class Activities {
  final int sold;
  final int reach;
  final int views;
  const Activities([this.sold = 0, this.reach = 0, this.views = 0]);

  factory Activities.fromJson(JSON json) => _$ActivitiesFromJson(json);
  JSON toJson() => _$ActivitiesToJson(this);
}
