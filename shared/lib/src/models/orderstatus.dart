import 'package:jars/jars_core.dart';
import 'package:shared/src/json_converters.dart';
part 'orderstatus.g.dart';

enum DeliveryStatus {
  pending,
  outForDelivery,
  delivered,
  delayed,
  atDoorStep,
  cancelled,
}

const consumer = 'consumer';
const seller = 'seller';

enum OrderState {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

@JsonSerializable(
  explicitToJson: true,
  constructor: '_',
  converters: [
    DateTimeConverter(),
    ColorConverter(),
  ],
)
class OrderStatus {
  // final String orderId;
  final DateTime lastUpdateAt;
  final OrderState status;
  final String? reason;
  final String? canceledBy;
  final DeliveryStatus? deliveryStatus;

  OrderStatus._({
    // ignore: unused_element
    this.canceledBy,
    required this.status,
    // required this.orderId,

    required this.deliveryStatus,
    required this.reason,
    required this.lastUpdateAt,
  });

  OrderStatus.pending({
    // required this.orderId,
    DateTime? lastUpdateAt,
  })  : status = OrderState.pending,
        canceledBy = null,
        reason = null,
        deliveryStatus = null,
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  OrderStatus.shipped({
    // required this.orderId,
    DateTime? lastUpdateAt,
  })  : status = OrderState.shipped,
        canceledBy = null,
        reason = null,
        deliveryStatus = null,
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  OrderStatus.processing({
    // required this.orderId,
    DateTime? lastUpdateAt,
  })  : status = OrderState.processing,
        canceledBy = null,
        reason = null,
        deliveryStatus = null,
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  OrderStatus.delivered({
    // required this.orderId,

    required this.deliveryStatus,
    DateTime? lastUpdateAt,
  })  : canceledBy = null,
        reason = null,
        status = OrderState.delivered,
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  OrderStatus.canceledByConsumer({
    // required this.orderId,
    required this.reason,
    required this.deliveryStatus,
    DateTime? lastUpdateAt,
  })  : canceledBy = consumer,
        status = OrderState.cancelled,
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  OrderStatus.canceledBySeller({
    // required this.orderId,
    required this.reason,
    required this.deliveryStatus,
    DateTime? lastUpdateAt,
  })  : canceledBy = seller,
        status = OrderState.cancelled,
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  factory OrderStatus.fromJson(JSON json) => _$OrderStatusFromJson(json);

  JSON toJson() => _$OrderStatusToJson(this);
}
