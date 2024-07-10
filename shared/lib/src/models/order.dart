// ignore_for_file: equal_keys_in_map

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/equatable.dart';
import 'package:jars/regpatterns.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';
import 'package:jars/jars_core.dart';
import 'package:uuid/uuid.dart';
part 'order.g.dart';

extension ListOrderedProductExt on List<OrderedProduct> {
  double get calcaulateFinalPrice => fold(0.0, (s, v) => s += v.finalPrice);
}

@defJsonSerializable
@CopyWith()
class OrderedProduct extends Equatable with ValidatorMixin {
  const OrderedProduct({
    required this.mrp,
    required this.title,
    required this.quantity,
    required this.thumbnail,
    required this.productId,
    required this.discount,
    this.shippingCost,
    this.deliveryCost,
    required this.deliveryEstimation,
    required this.orderStatus,
    this.deliveryAddress,
    this.reviewId,
    this.refund,
    this.replacement,
    this.warrantyPeriod,
    this.afterSalesServiceId,
  });

  OrderState get status => orderStatus.status;

  final String productId;
  final String? reviewId;
  final int quantity;
  final String thumbnail;
  final String title;
  final Address? deliveryAddress;
  final double mrp;
  final double discount;
  final double? shippingCost;
  final double? deliveryCost;
  final DeliveryEstimation deliveryEstimation;
  final OrderStatus orderStatus;
  final DurationPeriod? replacement;
  final DurationPeriod? refund;
  final DurationPeriod? warrantyPeriod;
  final String? afterSalesServiceId;

  double get discountedPrice => (mrp - (mrp * discount * 0.01)) * quantity;

  double get finalPrice => discountedPrice + (shippingCost ?? 0) + (deliveryCost ?? 0);

  factory OrderedProduct.fromJson(JSON json) => _$OrderedProductFromJson(json);

  JSON toJson() => _$OrderedProductToJson(this);

  @override
  List<Object?> get props => [
        mrp,
        title,
        reviewId,
        quantity,
        thumbnail,
        productId,
        discount,
        shippingCost,
        deliveryCost,
        deliveryEstimation,
        orderStatus,
        refund,
        replacement,
        warrantyPeriod,
        afterSalesServiceId,
        deliveryAddress
      ];

  @override
  void validator() {
    if (mrp.isNegative) throw ArgumentError(mrp);
    if (title.isBlank) throw ArgumentError(mrp);
    if (quantity.isNegative) throw ArgumentError(title);
    if (quantity.isInfiniteOrNuN || quantity.isInfinite) {
      throw ArgumentError('quantity sould be positive integer');
    }
    if (thumbnail.regNotMatch(regPatterns.url)) throw ArgumentError(thumbnail);
  }
}

@defJsonSerializable
@CopyWith()
class Order extends Equatable {
  Order({
    String? orderId,
    required this.consumerId,
    required this.products,
    required this.defaultDeliveryAddress,
    this.paymentMode,
    this.paymentId,
    this.signature,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : orderId = orderId ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  bool get isComplete => products.every((e) => e.status == OrderState.delivered);

  double get totalCost => products.fold(0, (sum, product) => sum + product.finalPrice);

  @CopyWithField.immutable()
  final String orderId;

  final String? paymentId;
  final String? signature;
  final String? paymentMode;

  @CopyWithField.immutable()
  final String consumerId;

  final Address defaultDeliveryAddress;
  final List<OrderedProduct> products;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Order.fromJson(JSON json) => _$OrderFromJson(json);

  JSON toJson() => _$OrderToJson(this);

  @override
  List<Object?> get props => [orderId, consumerId, defaultDeliveryAddress, products, createdAt];
}

extension OrderedProductExt on Product {
  OrderedProduct toOrderedProduct(int quantity, State state, bool free) {
    if (!deliveryMetaData.containsKey(state)) {
      return throw Exception('This product is currently unavailable in ${state.fullName}');
    }
    double shippingCost = free ? 0 : deliveryMetaData[state]?.shippingCost ?? 0;
    double deliveryCost = free ? 0 : deliveryMetaData[state]?.deliveryCost ?? 0;
    return OrderedProduct(
        mrp: mrp,
        title: title,
        quantity: quantity,
        thumbnail: thumbnail,
        productId: productId,
        discount: discount,
        shippingCost: shippingCost,
        deliveryCost: deliveryCost,
        deliveryEstimation: deliveryMetaData[state]?.deliveryEstimation ?? DeliveryEstimation.twoToThree,
        orderStatus: OrderStatus.pending(),
        warrantyPeriod: warrantyPeriod,
        afterSalesServiceId: afterSalesServiceId,
        refund: refund,
        replacement: replacement);
  }
}
