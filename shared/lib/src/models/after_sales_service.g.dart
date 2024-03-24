// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'after_sales_service.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AfterSalesServiceCWProxy {
  AfterSalesService period(DurationPeriod period);

  AfterSalesService serviceName(String serviceName);

  AfterSalesService freeCallSupport(bool freeCallSupport);

  AfterSalesService freeTechnicalSupport(bool freeTechnicalSupport);

  AfterSalesService repairingDiscount(double repairingDiscount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AfterSalesService(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AfterSalesService(...).copyWith(id: 12, name: "My name")
  /// ````
  AfterSalesService call({
    DurationPeriod? period,
    String? serviceName,
    bool? freeCallSupport,
    bool? freeTechnicalSupport,
    double? repairingDiscount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAfterSalesService.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAfterSalesService.copyWith.fieldName(...)`
class _$AfterSalesServiceCWProxyImpl implements _$AfterSalesServiceCWProxy {
  const _$AfterSalesServiceCWProxyImpl(this._value);

  final AfterSalesService _value;

  @override
  AfterSalesService period(DurationPeriod period) => this(period: period);

  @override
  AfterSalesService serviceName(String serviceName) =>
      this(serviceName: serviceName);

  @override
  AfterSalesService freeCallSupport(bool freeCallSupport) =>
      this(freeCallSupport: freeCallSupport);

  @override
  AfterSalesService freeTechnicalSupport(bool freeTechnicalSupport) =>
      this(freeTechnicalSupport: freeTechnicalSupport);

  @override
  AfterSalesService repairingDiscount(double repairingDiscount) =>
      this(repairingDiscount: repairingDiscount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AfterSalesService(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AfterSalesService(...).copyWith(id: 12, name: "My name")
  /// ````
  AfterSalesService call({
    Object? period = const $CopyWithPlaceholder(),
    Object? serviceName = const $CopyWithPlaceholder(),
    Object? freeCallSupport = const $CopyWithPlaceholder(),
    Object? freeTechnicalSupport = const $CopyWithPlaceholder(),
    Object? repairingDiscount = const $CopyWithPlaceholder(),
  }) {
    return AfterSalesService(
      serviceId: _value.serviceId,
      period: period == const $CopyWithPlaceholder() || period == null
          ? _value.period
          // ignore: cast_nullable_to_non_nullable
          : period as DurationPeriod,
      serviceName:
          serviceName == const $CopyWithPlaceholder() || serviceName == null
              ? _value.serviceName
              // ignore: cast_nullable_to_non_nullable
              : serviceName as String,
      freeCallSupport: freeCallSupport == const $CopyWithPlaceholder() ||
              freeCallSupport == null
          ? _value.freeCallSupport
          // ignore: cast_nullable_to_non_nullable
          : freeCallSupport as bool,
      freeTechnicalSupport:
          freeTechnicalSupport == const $CopyWithPlaceholder() ||
                  freeTechnicalSupport == null
              ? _value.freeTechnicalSupport
              // ignore: cast_nullable_to_non_nullable
              : freeTechnicalSupport as bool,
      repairingDiscount: repairingDiscount == const $CopyWithPlaceholder() ||
              repairingDiscount == null
          ? _value.repairingDiscount
          // ignore: cast_nullable_to_non_nullable
          : repairingDiscount as double,
    );
  }
}

extension $AfterSalesServiceCopyWith on AfterSalesService {
  /// Returns a callable class that can be used as follows: `instanceOfAfterSalesService.copyWith(...)` or like so:`instanceOfAfterSalesService.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AfterSalesServiceCWProxy get copyWith =>
      _$AfterSalesServiceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterSalesService _$AfterSalesServiceFromJson(Map<String, dynamic> json) =>
    AfterSalesService(
      serviceId: json['serviceId'] as String?,
      period: DurationPeriod.fromJson(json['period'] as Map<String, dynamic>),
      serviceName: json['serviceName'] as String,
      freeCallSupport: json['freeCallSupport'] as bool,
      freeTechnicalSupport: json['freeTechnicalSupport'] as bool,
      repairingDiscount: (json['repairingDiscount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$AfterSalesServiceToJson(AfterSalesService instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'freeCallSupport': instance.freeCallSupport,
      'freeTechnicalSupport': instance.freeTechnicalSupport,
      'repairingDiscount': instance.repairingDiscount,
      'period': instance.period.toJson(),
    };
