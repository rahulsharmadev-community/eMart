import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:repositories/src/utils/json_converters.dart';

part 'appmetadata.g.dart';

@defJsonSerializable
class AppMetaData {
  final List<String> publicCategories;
  final List<Categories> categories;
  final AlertModel? gloabalAlertBanner;
  final LocalAlertBanner? localAlertBanner;
  final AlertModel? producHighReturnAlertBanner;
  final AlertModel? orderProgressAlertBanner;
  final LiveCountdownModel? liveCountdownBanner;

  

  List<String>? getCategoriesByTitle(String title) =>
      categories.firstWhereOrNull((e) => e.title == title)?.categories;

  AppMetaData(
    this.categories,
    this.publicCategories,
    this.gloabalAlertBanner,
    this.localAlertBanner,
    this.producHighReturnAlertBanner,
    this.orderProgressAlertBanner,
    this.liveCountdownBanner,
  );

  factory AppMetaData.fromJson(JSON json) => _$AppMetaDataFromJson(json);

  JSON toJson() => _$AppMetaDataToJson(this);
}

@defJsonSerializable
class LocalAlertBanner {
  final AlertModel? homeScreen;
  final AlertModel? productScreen;
  final AlertModel? settingScreen;
  final AlertModel? cartScreen;

  LocalAlertBanner({this.homeScreen, this.productScreen, this.settingScreen, this.cartScreen});
  factory LocalAlertBanner.fromJson(JSON json) => _$LocalAlertBannerFromJson(json);

  JSON toJson() => _$LocalAlertBannerToJson(this);
}
