// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Policies _$PoliciesFromJson(Map<String, dynamic> json) => Policies(
      aboutUs: json['aboutUs'] as String?,
      contactUs: json['contactUs'] as String?,
      privacyPolicy: json['privacyPolicy'] as String?,
      termsOfUse: json['termsOfUse'] as String?,
      affiliatePolicy: json['affiliatePolicy'] as String?,
      infringementPolicy: json['infringementPolicy'] as String?,
      refundPolicy: json['refundPolicy'] as String?,
      cancellationPolicy: json['cancellationPolicy'] as String?,
    );

Map<String, dynamic> _$PoliciesToJson(Policies instance) => <String, dynamic>{
      'aboutUs': instance.aboutUs,
      'contactUs': instance.contactUs,
      'privacyPolicy': instance.privacyPolicy,
      'termsOfUse': instance.termsOfUse,
      'affiliatePolicy': instance.affiliatePolicy,
      'infringementPolicy': instance.infringementPolicy,
      'refundPolicy': instance.refundPolicy,
      'cancellationPolicy': instance.cancellationPolicy,
    };
