// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models/orderstatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) => OrderStatus._(
      canceledBy: json['canceledBy'] as String?,
      status: $enumDecode(_$OrderStateEnumMap, json['status']),
      orderId: json['orderId'] as String,
      paymentMode:
          $enumDecodeNullable(_$PaymentModeEnumMap, json['paymentMode']),
      deliveryStatus:
          $enumDecodeNullable(_$DeliveryStatusEnumMap, json['deliveryStatus']),
      reason: json['reason'] as String?,
      lastUpdateAt: DateTime.parse(json['lastUpdateAt'] as String),
    );

Map<String, dynamic> _$OrderStatusToJson(OrderStatus instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'lastUpdateAt': instance.lastUpdateAt.toIso8601String(),
      'status': _$OrderStateEnumMap[instance.status]!,
      'paymentMode': _$PaymentModeEnumMap[instance.paymentMode],
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

const _$PaymentModeEnumMap = {
  PaymentMode.creditCard: 'creditCard',
  PaymentMode.debitCard: 'debitCard',
  PaymentMode.upi: 'upi',
  PaymentMode.amazonPay: 'amazonPay',
  PaymentMode.giftCard: 'giftCard',
  PaymentMode.cashOnDelivery: 'cashOnDelivery',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.pending: 'pending',
  DeliveryStatus.outForDelivery: 'outForDelivery',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.delayed: 'delayed',
  DeliveryStatus.atDoorStep: 'atDoorStep',
  DeliveryStatus.cancelled: 'cancelled',
};
