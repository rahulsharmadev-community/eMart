import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/models.dart';
import 'package:shared/src/helper.dart';

part 'productmetadata.g.dart';

@CopyWith(skipFields: true)
@defJson
class MonthlyActivities {
  final int bought;
  final int reach;
  final int views;
  const MonthlyActivities([this.bought = 0, this.reach = 0, this.views = 0]);

  factory MonthlyActivities.fromJson(JSON json) => _$MonthlyActivitiesFromJson(json);
  JSON toJson() => _$MonthlyActivitiesToJson(this);
}

@defJson
@CopyWith(skipFields: true)
class ProductMetaData {
  /// Don't increase manually increase automatically in server
  const ProductMetaData([
    this.star1 = 0,
    this.star2 = 0,
    this.star3 = 0,
    this.star4 = 0,
    this.star5 = 0,
    this.totalReviews = 0,
    this.monthlyActivities = const {},
  ]);

  final int star1;
  final int star2;
  final int star3;
  final int star4;
  final int star5;
  final int totalReviews;
  final Map<String, MonthlyActivities> monthlyActivities;

  factory ProductMetaData.fromJson(JSON json) => _$ProductMetaDataFromJson(json);

  JSON toJson() => _$ProductMetaDataToJson(this);

  double get rating {
    int count = (star1 + star2 * 2 + star3 * 3 + star4 * 4 + star5 * 5);
    return count / totalReviews;
  }

  MonthlyActivities? get lastMonthActivities {
    var now = DateTime.now();
    return monthlyActivities["${now.month - 1}${now.year}"];
  }

  MonthlyActivities? activities(DateTime dateTime) {
    return monthlyActivities["${dateTime.month - 1}${dateTime.year}"];
  }
}
