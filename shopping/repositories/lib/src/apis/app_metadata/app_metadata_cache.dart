part of 'app_metadata_repository.dart';

class AppMetaDataCache extends HydratedCubit<AppMetaData?> {
  AppMetaDataCache() : super(null);

  void set(AppMetaData data) => emit(data);

  AppMetaData? get() {
    logs.i("AppMetaDataCache:get() initiating");
    if (state == null || state!.expiry.isBefore(DateTime.now())) return null;
    return state;
  }

  List<Categories>? getCategories() => get()?.categories;

  @override
  fromJson(Map<String, dynamic> json) {
    return json['state'] != null ? AppMetaData.fromJson(json['state']) : null;
  }

  @override
  Map<String, dynamic>? toJson(state) => {'state': state?.toJson()};
}
