// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appmetadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppMetaData _$AppMetaDataFromJson(Map<String, dynamic> json) => AppMetaData(
      (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['publicCategories'] as List<dynamic>).map((e) => e as String).toList(),
      json['gloabalAlertBanner'] == null
          ? null
          : AlertModel.fromJson(json['gloabalAlertBanner'] as Map<String, dynamic>),
      json['localAlertBanner'] == null ? null : LocalAlertBanner.fromJson(json['localAlertBanner']),
      json['producHighReturnAlertBanner'] == null
          ? null
          : AlertModel.fromJson(json['producHighReturnAlertBanner'] as Map<String, dynamic>),
      json['orderProgressAlertBanner'] == null
          ? null
          : AlertModel.fromJson(json['orderProgressAlertBanner'] as Map<String, dynamic>),
      json['liveCountdownBanner'] == null
          ? null
          : LiveCountdownModel.fromJson(json['liveCountdownBanner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppMetaDataToJson(AppMetaData instance) => <String, dynamic>{
      'publicCategories': instance.publicCategories,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'gloabalAlertBanner': instance.gloabalAlertBanner?.toJson(),
      'localAlertBanner': instance.localAlertBanner?.toJson(),
      'producHighReturnAlertBanner': instance.producHighReturnAlertBanner?.toJson(),
      'orderProgressAlertBanner': instance.orderProgressAlertBanner?.toJson(),
      'liveCountdownBanner': instance.liveCountdownBanner?.toJson(),
    };

LocalAlertBanner _$LocalAlertBannerFromJson(Map<String, dynamic> json) => LocalAlertBanner(
      homeScreen:
          json['homeScreen'] == null ? null : AlertModel.fromJson(json['homeScreen'] as Map<String, dynamic>),
      productScreen: json['productScreen'] == null
          ? null
          : AlertModel.fromJson(json['productScreen'] as Map<String, dynamic>),
      settingScreen: json['settingScreen'] == null
          ? null
          : AlertModel.fromJson(json['settingScreen'] as Map<String, dynamic>),
      cartScreen:
          json['cartScreen'] == null ? null : AlertModel.fromJson(json['cartScreen'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalAlertBannerToJson(LocalAlertBanner instance) => <String, dynamic>{
      'homeScreen': instance.homeScreen?.toJson(),
      'productScreen': instance.productScreen?.toJson(),
      'settingScreen': instance.settingScreen?.toJson(),
      'cartScreen': instance.cartScreen?.toJson(),
    };
