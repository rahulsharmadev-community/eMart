// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderstatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) => OrderStatus._(
      canceledBy: json['canceledBy'] as String?,
      status: $enumDecode(_$OrderStateEnumMap, json['status']),
      deliveryStatus:
          $enumDecodeNullable(_$DeliveryStatusEnumMap, json['deliveryStatus']),
      reason: json['reason'] as String?,
      lastUpdateAt: const DateTimeConverter()
          .fromJson((json['lastUpdateAt'] as num).toInt()),
    );

Map<String, dynamic> _$OrderStatusToJson(OrderStatus instance) =>
    <String, dynamic>{
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
      'status': _$OrderStateEnumMap[instance.status]!,
      'reason': instance.reason,
      'canceledBy': instance.canceledBy,
      'deliveryStatus': _$DeliveryStatusEnumMap[instance.deliveryStatus],
    };

const _$OrderStateEnumMap = {
  OrderState.pending: 'pending',
  OrderState.processing: 'processing',
  OrderState.shipped: 'shipped',
  OrderState.delivered: 'delivered',
  OrderState.cancelled: 'cancelled',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.pending: 'pending',
  DeliveryStatus.outForDelivery: 'outForDelivery',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.delayed: 'delayed',
  DeliveryStatus.atDoorStep: 'atDoorStep',
  DeliveryStatus.cancelled: 'cancelled',
};
