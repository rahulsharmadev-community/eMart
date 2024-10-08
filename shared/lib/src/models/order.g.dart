// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderedProductCWProxy {
  OrderedProduct mrp(double mrp);

  OrderedProduct title(String title);

  OrderedProduct quantity(int quantity);

  OrderedProduct thumbnail(String thumbnail);

  OrderedProduct productId(String productId);

  OrderedProduct discount(double discount);

  OrderedProduct shippingCost(double? shippingCost);

  OrderedProduct deliveryCost(double? deliveryCost);

  OrderedProduct deliveryEstimation(DeliveryEstimation deliveryEstimation);

  OrderedProduct orderStatus(OrderStatus orderStatus);

  OrderedProduct deliveryAddress(Address? deliveryAddress);

  OrderedProduct reviewId(String? reviewId);

  OrderedProduct refund(DurationPeriod? refund);

  OrderedProduct replacement(DurationPeriod? replacement);

  OrderedProduct warrantyPeriod(DurationPeriod? warrantyPeriod);

  OrderedProduct afterSalesServiceId(String? afterSalesServiceId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderedProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderedProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderedProduct call({
    double? mrp,
    String? title,
    int? quantity,
    String? thumbnail,
    String? productId,
    double? discount,
    double? shippingCost,
    double? deliveryCost,
    DeliveryEstimation? deliveryEstimation,
    OrderStatus? orderStatus,
    Address? deliveryAddress,
    String? reviewId,
    DurationPeriod? refund,
    DurationPeriod? replacement,
    DurationPeriod? warrantyPeriod,
    String? afterSalesServiceId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderedProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderedProduct.copyWith.fieldName(...)`
class _$OrderedProductCWProxyImpl implements _$OrderedProductCWProxy {
  const _$OrderedProductCWProxyImpl(this._value);

  final OrderedProduct _value;

  @override
  OrderedProduct mrp(double mrp) => this(mrp: mrp);

  @override
  OrderedProduct title(String title) => this(title: title);

  @override
  OrderedProduct quantity(int quantity) => this(quantity: quantity);

  @override
  OrderedProduct thumbnail(String thumbnail) => this(thumbnail: thumbnail);

  @override
  OrderedProduct productId(String productId) => this(productId: productId);

  @override
  OrderedProduct discount(double discount) => this(discount: discount);

  @override
  OrderedProduct shippingCost(double? shippingCost) =>
      this(shippingCost: shippingCost);

  @override
  OrderedProduct deliveryCost(double? deliveryCost) =>
      this(deliveryCost: deliveryCost);

  @override
  OrderedProduct deliveryEstimation(DeliveryEstimation deliveryEstimation) =>
      this(deliveryEstimation: deliveryEstimation);

  @override
  OrderedProduct orderStatus(OrderStatus orderStatus) =>
      this(orderStatus: orderStatus);

  @override
  OrderedProduct deliveryAddress(Address? deliveryAddress) =>
      this(deliveryAddress: deliveryAddress);

  @override
  OrderedProduct reviewId(String? reviewId) => this(reviewId: reviewId);

  @override
  OrderedProduct refund(DurationPeriod? refund) => this(refund: refund);

  @override
  OrderedProduct replacement(DurationPeriod? replacement) =>
      this(replacement: replacement);

  @override
  OrderedProduct warrantyPeriod(DurationPeriod? warrantyPeriod) =>
      this(warrantyPeriod: warrantyPeriod);

  @override
  OrderedProduct afterSalesServiceId(String? afterSalesServiceId) =>
      this(afterSalesServiceId: afterSalesServiceId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderedProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderedProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderedProduct call({
    Object? mrp = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? thumbnail = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
    Object? discount = const $CopyWithPlaceholder(),
    Object? shippingCost = const $CopyWithPlaceholder(),
    Object? deliveryCost = const $CopyWithPlaceholder(),
    Object? deliveryEstimation = const $CopyWithPlaceholder(),
    Object? orderStatus = const $CopyWithPlaceholder(),
    Object? deliveryAddress = const $CopyWithPlaceholder(),
    Object? reviewId = const $CopyWithPlaceholder(),
    Object? refund = const $CopyWithPlaceholder(),
    Object? replacement = const $CopyWithPlaceholder(),
    Object? warrantyPeriod = const $CopyWithPlaceholder(),
    Object? afterSalesServiceId = const $CopyWithPlaceholder(),
  }) {
    return OrderedProduct(
      mrp: mrp == const $CopyWithPlaceholder() || mrp == null
          ? _value.mrp
          // ignore: cast_nullable_to_non_nullable
          : mrp as double,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      quantity: quantity == const $CopyWithPlaceholder() || quantity == null
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int,
      thumbnail: thumbnail == const $CopyWithPlaceholder() || thumbnail == null
          ? _value.thumbnail
          // ignore: cast_nullable_to_non_nullable
          : thumbnail as String,
      productId: productId == const $CopyWithPlaceholder() || productId == null
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as String,
      discount: discount == const $CopyWithPlaceholder() || discount == null
          ? _value.discount
          // ignore: cast_nullable_to_non_nullable
          : discount as double,
      shippingCost: shippingCost == const $CopyWithPlaceholder()
          ? _value.shippingCost
          // ignore: cast_nullable_to_non_nullable
          : shippingCost as double?,
      deliveryCost: deliveryCost == const $CopyWithPlaceholder()
          ? _value.deliveryCost
          // ignore: cast_nullable_to_non_nullable
          : deliveryCost as double?,
      deliveryEstimation: deliveryEstimation == const $CopyWithPlaceholder() ||
              deliveryEstimation == null
          ? _value.deliveryEstimation
          // ignore: cast_nullable_to_non_nullable
          : deliveryEstimation as DeliveryEstimation,
      orderStatus:
          orderStatus == const $CopyWithPlaceholder() || orderStatus == null
              ? _value.orderStatus
              // ignore: cast_nullable_to_non_nullable
              : orderStatus as OrderStatus,
      deliveryAddress: deliveryAddress == const $CopyWithPlaceholder()
          ? _value.deliveryAddress
          // ignore: cast_nullable_to_non_nullable
          : deliveryAddress as Address?,
      reviewId: reviewId == const $CopyWithPlaceholder()
          ? _value.reviewId
          // ignore: cast_nullable_to_non_nullable
          : reviewId as String?,
      refund: refund == const $CopyWithPlaceholder()
          ? _value.refund
          // ignore: cast_nullable_to_non_nullable
          : refund as DurationPeriod?,
      replacement: replacement == const $CopyWithPlaceholder()
          ? _value.replacement
          // ignore: cast_nullable_to_non_nullable
          : replacement as DurationPeriod?,
      warrantyPeriod: warrantyPeriod == const $CopyWithPlaceholder()
          ? _value.warrantyPeriod
          // ignore: cast_nullable_to_non_nullable
          : warrantyPeriod as DurationPeriod?,
      afterSalesServiceId: afterSalesServiceId == const $CopyWithPlaceholder()
          ? _value.afterSalesServiceId
          // ignore: cast_nullable_to_non_nullable
          : afterSalesServiceId as String?,
    );
  }
}

extension $OrderedProductCopyWith on OrderedProduct {
  /// Returns a callable class that can be used as follows: `instanceOfOrderedProduct.copyWith(...)` or like so:`instanceOfOrderedProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderedProductCWProxy get copyWith => _$OrderedProductCWProxyImpl(this);
}

abstract class _$OrderCWProxy {
  Order products(List<OrderedProduct> products);

  Order defaultDeliveryAddress(Address defaultDeliveryAddress);

  Order paymentMode(String? paymentMode);

  Order paymentId(String? paymentId);

  Order signature(String? signature);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    List<OrderedProduct>? products,
    Address? defaultDeliveryAddress,
    String? paymentMode,
    String? paymentId,
    String? signature,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrder.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrder.copyWith.fieldName(...)`
class _$OrderCWProxyImpl implements _$OrderCWProxy {
  const _$OrderCWProxyImpl(this._value);

  final Order _value;

  @override
  Order products(List<OrderedProduct> products) => this(products: products);

  @override
  Order defaultDeliveryAddress(Address defaultDeliveryAddress) =>
      this(defaultDeliveryAddress: defaultDeliveryAddress);

  @override
  Order paymentMode(String? paymentMode) => this(paymentMode: paymentMode);

  @override
  Order paymentId(String? paymentId) => this(paymentId: paymentId);

  @override
  Order signature(String? signature) => this(signature: signature);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    Object? products = const $CopyWithPlaceholder(),
    Object? defaultDeliveryAddress = const $CopyWithPlaceholder(),
    Object? paymentMode = const $CopyWithPlaceholder(),
    Object? paymentId = const $CopyWithPlaceholder(),
    Object? signature = const $CopyWithPlaceholder(),
  }) {
    return Order(
      orderId: _value.orderId,
      consumerId: _value.consumerId,
      products: products == const $CopyWithPlaceholder() || products == null
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<OrderedProduct>,
      defaultDeliveryAddress:
          defaultDeliveryAddress == const $CopyWithPlaceholder() ||
                  defaultDeliveryAddress == null
              ? _value.defaultDeliveryAddress
              // ignore: cast_nullable_to_non_nullable
              : defaultDeliveryAddress as Address,
      paymentMode: paymentMode == const $CopyWithPlaceholder()
          ? _value.paymentMode
          // ignore: cast_nullable_to_non_nullable
          : paymentMode as String?,
      paymentId: paymentId == const $CopyWithPlaceholder()
          ? _value.paymentId
          // ignore: cast_nullable_to_non_nullable
          : paymentId as String?,
      signature: signature == const $CopyWithPlaceholder()
          ? _value.signature
          // ignore: cast_nullable_to_non_nullable
          : signature as String?,
      createdAt: _value.createdAt,
    );
  }
}

extension $OrderCopyWith on Order {
  /// Returns a callable class that can be used as follows: `instanceOfOrder.copyWith(...)` or like so:`instanceOfOrder.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderCWProxy get copyWith => _$OrderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderedProduct _$OrderedProductFromJson(Map<String, dynamic> json) =>
    OrderedProduct(
      mrp: (json['mrp'] as num).toDouble(),
      title: json['title'] as String,
      quantity: (json['quantity'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
      productId: json['productId'] as String,
      discount: (json['discount'] as num).toDouble(),
      shippingCost: (json['shippingCost'] as num?)?.toDouble(),
      deliveryCost: (json['deliveryCost'] as num?)?.toDouble(),
      deliveryEstimation:
          $enumDecode(_$DeliveryEstimationEnumMap, json['deliveryEstimation']),
      orderStatus:
          OrderStatus.fromJson(json['orderStatus'] as Map<String, dynamic>),
      deliveryAddress: json['deliveryAddress'] == null
          ? null
          : Address.fromJson(json['deliveryAddress'] as Map<String, dynamic>),
      reviewId: json['reviewId'] as String?,
      refund: json['refund'] == null
          ? null
          : DurationPeriod.fromJson(json['refund'] as Map<String, dynamic>),
      replacement: json['replacement'] == null
          ? null
          : DurationPeriod.fromJson(
              json['replacement'] as Map<String, dynamic>),
      warrantyPeriod: json['warrantyPeriod'] == null
          ? null
          : DurationPeriod.fromJson(
              json['warrantyPeriod'] as Map<String, dynamic>),
      afterSalesServiceId: json['afterSalesServiceId'] as String?,
    );

Map<String, dynamic> _$OrderedProductToJson(OrderedProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'reviewId': instance.reviewId,
      'quantity': instance.quantity,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'deliveryAddress': instance.deliveryAddress?.toJson(),
      'mrp': instance.mrp,
      'discount': instance.discount,
      'shippingCost': instance.shippingCost,
      'deliveryCost': instance.deliveryCost,
      'deliveryEstimation':
          _$DeliveryEstimationEnumMap[instance.deliveryEstimation]!,
      'orderStatus': instance.orderStatus.toJson(),
      'replacement': instance.replacement?.toJson(),
      'refund': instance.refund?.toJson(),
      'warrantyPeriod': instance.warrantyPeriod?.toJson(),
      'afterSalesServiceId': instance.afterSalesServiceId,
    };

const _$DeliveryEstimationEnumMap = {
  DeliveryEstimation.oneToTwo: 'oneToTwo',
  DeliveryEstimation.twoToThree: 'twoToThree',
  DeliveryEstimation.fiveToSeven: 'fiveToSeven',
  DeliveryEstimation.tenToFifteen: 'tenToFifteen',
};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['orderId'] as String?,
      consumerId: json['consumerId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultDeliveryAddress: Address.fromJson(
          json['defaultDeliveryAddress'] as Map<String, dynamic>),
      paymentMode: json['paymentMode'] as String?,
      paymentId: json['paymentId'] as String?,
      signature: json['signature'] as String?,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'paymentId': instance.paymentId,
      'signature': instance.signature,
      'paymentMode': instance.paymentMode,
      'consumerId': instance.consumerId,
      'defaultDeliveryAddress': instance.defaultDeliveryAddress.toJson(),
      'products': instance.products.map((e) => e.toJson()).toList(),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
