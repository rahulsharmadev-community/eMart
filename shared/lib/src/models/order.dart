// ignore_for_file: equal_keys_in_map

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared/models.dart';
import 'package:shared/src/helper.dart';
import 'package:uuid/uuid.dart';
part 'order.g.dart';

@defJson
@CopyWith()
class OrderedProduct {
  OrderedProduct({
    required this.mrp,
    required this.title,
    required this.reviewId,
    required this.quantity,
    required this.thumbnail,
    required this.productId,
    required this.discount,
    required this.shippingCost,
    required this.deliveryCost,
    required this.deliveryEstimation,
    required this.orderStatus,
    this.refund,
    this.replacement,
    this.warrantyPeriod,
    this.afterSalesService,
  });

  OrderState get status => orderStatus.status;

  final String productId;
  final String? reviewId;
  final int quantity;
  final String thumbnail;
  final String title;
  final double mrp;
  final double discount;
  final double shippingCost;
  final double deliveryCost;
  final DeliveryEstimation deliveryEstimation;
  final OrderStatus orderStatus;
  final DurationPeriod? replacement;
  final DurationPeriod? refund;
  final DurationPeriod? warrantyPeriod;
  final AfterSalesService? afterSalesService;

  factory OrderedProduct.fromJson(JSON json) => _$OrderedProductFromJson(json);

  JSON toJson() => _$OrderedProductToJson(this);
}

@defJson
@CopyWith()
class Order {
  Order({
    String? orderId,
    required this.consumerId,
    required this.products,
    required this.deliveryAddress,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : orderId = orderId ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  bool get isComplete => products.every((e) => e.status == OrderState.delivered);

  @CopyWithField.immutable()
  final String orderId;

  @CopyWithField.immutable()
  final String consumerId;

  final Address deliveryAddress;

  final List<OrderedProduct> products;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Order.fromJson(JSON json) => _$OrderFromJson(json);

  JSON toJson() => _$OrderToJson(this);
}
