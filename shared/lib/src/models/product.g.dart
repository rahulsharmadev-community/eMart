// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductCWProxy {
  Product mrp(double mrp);

  Product title(String title);

  Product thumbnail(String thumbnail);

  Product unit(ProductUnit unit);

  Product productBrand(String? productBrand);

  Product shotDescription(String? shotDescription);

  Product warrantyPeriod(DurationPeriod? warrantyPeriod);

  Product replacement(DurationPeriod? replacement);

  Product refund(DurationPeriod? refund);

  Product afterSalesServiceId(String? afterSalesServiceId);

  Product discount(double discount);

  Product feature(List<String>? feature);

  Product imageUrls(List<String> imageUrls);

  Product variants(List<String> variants);

  Product category(List<String> category);

  Product keywords(List<String> keywords);

  Product detailedSpecs(Map<String, String> detailedSpecs);

  Product deliveryMetaData(Map<State, DeliveryMetaData> deliveryMetaData);

  Product rating(int rating);

  Product totalReviews(int totalReviews);

  Product status(ProductStockStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Product(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Product(...).copyWith(id: 12, name: "My name")
  /// ````
  Product call({
    double? mrp,
    String? title,
    String? thumbnail,
    ProductUnit? unit,
    String? productBrand,
    String? shotDescription,
    DurationPeriod? warrantyPeriod,
    DurationPeriod? replacement,
    DurationPeriod? refund,
    String? afterSalesServiceId,
    double? discount,
    List<String>? feature,
    List<String>? imageUrls,
    List<String>? variants,
    List<String>? category,
    List<String>? keywords,
    Map<String, String>? detailedSpecs,
    Map<State, DeliveryMetaData>? deliveryMetaData,
    int? rating,
    int? totalReviews,
    ProductStockStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProduct.copyWith.fieldName(...)`
class _$ProductCWProxyImpl implements _$ProductCWProxy {
  const _$ProductCWProxyImpl(this._value);

  final Product _value;

  @override
  Product mrp(double mrp) => this(mrp: mrp);

  @override
  Product title(String title) => this(title: title);

  @override
  Product thumbnail(String thumbnail) => this(thumbnail: thumbnail);

  @override
  Product unit(ProductUnit unit) => this(unit: unit);

  @override
  Product productBrand(String? productBrand) =>
      this(productBrand: productBrand);

  @override
  Product shotDescription(String? shotDescription) =>
      this(shotDescription: shotDescription);

  @override
  Product warrantyPeriod(DurationPeriod? warrantyPeriod) =>
      this(warrantyPeriod: warrantyPeriod);

  @override
  Product replacement(DurationPeriod? replacement) =>
      this(replacement: replacement);

  @override
  Product refund(DurationPeriod? refund) => this(refund: refund);

  @override
  Product afterSalesServiceId(String? afterSalesServiceId) =>
      this(afterSalesServiceId: afterSalesServiceId);

  @override
  Product discount(double discount) => this(discount: discount);

  @override
  Product feature(List<String>? feature) => this(feature: feature);

  @override
  Product imageUrls(List<String> imageUrls) => this(imageUrls: imageUrls);

  @override
  Product variants(List<String> variants) => this(variants: variants);

  @override
  Product category(List<String> category) => this(category: category);

  @override
  Product keywords(List<String> keywords) => this(keywords: keywords);

  @override
  Product detailedSpecs(Map<String, String> detailedSpecs) =>
      this(detailedSpecs: detailedSpecs);

  @override
  Product deliveryMetaData(Map<State, DeliveryMetaData> deliveryMetaData) =>
      this(deliveryMetaData: deliveryMetaData);

  @override
  Product rating(int rating) => this(rating: rating);

  @override
  Product totalReviews(int totalReviews) => this(totalReviews: totalReviews);

  @override
  Product status(ProductStockStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Product(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Product(...).copyWith(id: 12, name: "My name")
  /// ````
  Product call({
    Object? mrp = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? thumbnail = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
    Object? productBrand = const $CopyWithPlaceholder(),
    Object? shotDescription = const $CopyWithPlaceholder(),
    Object? warrantyPeriod = const $CopyWithPlaceholder(),
    Object? replacement = const $CopyWithPlaceholder(),
    Object? refund = const $CopyWithPlaceholder(),
    Object? afterSalesServiceId = const $CopyWithPlaceholder(),
    Object? discount = const $CopyWithPlaceholder(),
    Object? feature = const $CopyWithPlaceholder(),
    Object? imageUrls = const $CopyWithPlaceholder(),
    Object? variants = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? keywords = const $CopyWithPlaceholder(),
    Object? detailedSpecs = const $CopyWithPlaceholder(),
    Object? deliveryMetaData = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? totalReviews = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return Product(
      productId: _value.productId,
      shopId: _value.shopId,
      mrp: mrp == const $CopyWithPlaceholder() || mrp == null
          ? _value.mrp
          // ignore: cast_nullable_to_non_nullable
          : mrp as double,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      thumbnail: thumbnail == const $CopyWithPlaceholder() || thumbnail == null
          ? _value.thumbnail
          // ignore: cast_nullable_to_non_nullable
          : thumbnail as String,
      unit: unit == const $CopyWithPlaceholder() || unit == null
          ? _value.unit
          // ignore: cast_nullable_to_non_nullable
          : unit as ProductUnit,
      productBrand: productBrand == const $CopyWithPlaceholder()
          ? _value.productBrand
          // ignore: cast_nullable_to_non_nullable
          : productBrand as String?,
      shotDescription: shotDescription == const $CopyWithPlaceholder()
          ? _value.shotDescription
          // ignore: cast_nullable_to_non_nullable
          : shotDescription as String?,
      warrantyPeriod: warrantyPeriod == const $CopyWithPlaceholder()
          ? _value.warrantyPeriod
          // ignore: cast_nullable_to_non_nullable
          : warrantyPeriod as DurationPeriod?,
      replacement: replacement == const $CopyWithPlaceholder()
          ? _value.replacement
          // ignore: cast_nullable_to_non_nullable
          : replacement as DurationPeriod?,
      refund: refund == const $CopyWithPlaceholder()
          ? _value.refund
          // ignore: cast_nullable_to_non_nullable
          : refund as DurationPeriod?,
      afterSalesServiceId: afterSalesServiceId == const $CopyWithPlaceholder()
          ? _value.afterSalesServiceId
          // ignore: cast_nullable_to_non_nullable
          : afterSalesServiceId as String?,
      discount: discount == const $CopyWithPlaceholder() || discount == null
          ? _value.discount
          // ignore: cast_nullable_to_non_nullable
          : discount as double,
      feature: feature == const $CopyWithPlaceholder()
          ? _value.feature
          // ignore: cast_nullable_to_non_nullable
          : feature as List<String>?,
      imageUrls: imageUrls == const $CopyWithPlaceholder() || imageUrls == null
          ? _value.imageUrls
          // ignore: cast_nullable_to_non_nullable
          : imageUrls as List<String>,
      variants: variants == const $CopyWithPlaceholder() || variants == null
          ? _value.variants
          // ignore: cast_nullable_to_non_nullable
          : variants as List<String>,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as List<String>,
      keywords: keywords == const $CopyWithPlaceholder() || keywords == null
          ? _value.keywords
          // ignore: cast_nullable_to_non_nullable
          : keywords as List<String>,
      detailedSpecs:
          detailedSpecs == const $CopyWithPlaceholder() || detailedSpecs == null
              ? _value.detailedSpecs
              // ignore: cast_nullable_to_non_nullable
              : detailedSpecs as Map<String, String>,
      deliveryMetaData: deliveryMetaData == const $CopyWithPlaceholder() ||
              deliveryMetaData == null
          ? _value.deliveryMetaData
          // ignore: cast_nullable_to_non_nullable
          : deliveryMetaData as Map<State, DeliveryMetaData>,
      rating: rating == const $CopyWithPlaceholder() || rating == null
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int,
      totalReviews:
          totalReviews == const $CopyWithPlaceholder() || totalReviews == null
              ? _value.totalReviews
              // ignore: cast_nullable_to_non_nullable
              : totalReviews as int,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ProductStockStatus,
      createdAt: _value.createdAt,
    );
  }
}

extension $ProductCopyWith on Product {
  /// Returns a callable class that can be used as follows: `instanceOfProduct.copyWith(...)` or like so:`instanceOfProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductCWProxy get copyWith => _$ProductCWProxyImpl(this);
}

abstract class _$DeliveryMetaDataCWProxy {
  DeliveryMetaData shippingCost(double shippingCost);

  DeliveryMetaData deliveryCost(double deliveryCost);

  DeliveryMetaData deliveryEstimation(DeliveryEstimation deliveryEstimation);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeliveryMetaData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeliveryMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  DeliveryMetaData call({
    double? shippingCost,
    double? deliveryCost,
    DeliveryEstimation? deliveryEstimation,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeliveryMetaData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeliveryMetaData.copyWith.fieldName(...)`
class _$DeliveryMetaDataCWProxyImpl implements _$DeliveryMetaDataCWProxy {
  const _$DeliveryMetaDataCWProxyImpl(this._value);

  final DeliveryMetaData _value;

  @override
  DeliveryMetaData shippingCost(double shippingCost) =>
      this(shippingCost: shippingCost);

  @override
  DeliveryMetaData deliveryCost(double deliveryCost) =>
      this(deliveryCost: deliveryCost);

  @override
  DeliveryMetaData deliveryEstimation(DeliveryEstimation deliveryEstimation) =>
      this(deliveryEstimation: deliveryEstimation);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeliveryMetaData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeliveryMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  DeliveryMetaData call({
    Object? shippingCost = const $CopyWithPlaceholder(),
    Object? deliveryCost = const $CopyWithPlaceholder(),
    Object? deliveryEstimation = const $CopyWithPlaceholder(),
  }) {
    return DeliveryMetaData(
      shippingCost:
          shippingCost == const $CopyWithPlaceholder() || shippingCost == null
              ? _value.shippingCost
              // ignore: cast_nullable_to_non_nullable
              : shippingCost as double,
      deliveryCost:
          deliveryCost == const $CopyWithPlaceholder() || deliveryCost == null
              ? _value.deliveryCost
              // ignore: cast_nullable_to_non_nullable
              : deliveryCost as double,
      deliveryEstimation: deliveryEstimation == const $CopyWithPlaceholder() ||
              deliveryEstimation == null
          ? _value.deliveryEstimation
          // ignore: cast_nullable_to_non_nullable
          : deliveryEstimation as DeliveryEstimation,
    );
  }
}

extension $DeliveryMetaDataCopyWith on DeliveryMetaData {
  /// Returns a callable class that can be used as follows: `instanceOfDeliveryMetaData.copyWith(...)` or like so:`instanceOfDeliveryMetaData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeliveryMetaDataCWProxy get copyWith => _$DeliveryMetaDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as String?,
      shopId: json['shopId'] as String,
      mrp: (json['mrp'] as num).toDouble(),
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      unit: ProductUnit.fromJson(json['unit'] as Map<String, dynamic>),
      productBrand: json['productBrand'] as String?,
      shotDescription: json['shotDescription'] as String?,
      warrantyPeriod: json['warrantyPeriod'] == null
          ? null
          : DurationPeriod.fromJson(
              json['warrantyPeriod'] as Map<String, dynamic>),
      replacement: json['replacement'] == null
          ? null
          : DurationPeriod.fromJson(
              json['replacement'] as Map<String, dynamic>),
      refund: json['refund'] == null
          ? null
          : DurationPeriod.fromJson(json['refund'] as Map<String, dynamic>),
      afterSalesServiceId: json['afterSalesServiceId'] as String?,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      feature: (json['feature'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      detailedSpecs: (json['detailedSpecs'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      deliveryMetaData:
          (json['deliveryMetaData'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry($enumDecode(_$StateEnumMap, k),
                    DeliveryMetaData.fromJson(e as Map<String, dynamic>)),
              ) ??
              const {},
      rating: json['rating'] as int? ?? 0,
      totalReviews: json['totalReviews'] as int? ?? 0,
      status:
          $enumDecodeNullable(_$ProductStockStatusEnumMap, json['status']) ??
              ProductStockStatus.available,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUpdateAt: json['lastUpdateAt'] == null
          ? null
          : DateTime.parse(json['lastUpdateAt'] as String),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'shopId': instance.shopId,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'category': instance.category,
      'shotDescription': instance.shotDescription,
      'keywords': instance.keywords,
      'productBrand': instance.productBrand,
      'mrp': instance.mrp,
      'imageUrls': instance.imageUrls,
      'variants': instance.variants,
      'warrantyPeriod': instance.warrantyPeriod?.toJson(),
      'feature': instance.feature,
      'unit': instance.unit.toJson(),
      'detailedSpecs': instance.detailedSpecs,
      'replacement': instance.replacement?.toJson(),
      'refund': instance.refund?.toJson(),
      'afterSalesServiceId': instance.afterSalesServiceId,
      'status': _$ProductStockStatusEnumMap[instance.status]!,
      'discount': instance.discount,
      'deliveryMetaData': instance.deliveryMetaData
          .map((k, e) => MapEntry(_$StateEnumMap[k]!, e.toJson())),
      'totalReviews': instance.totalReviews,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUpdateAt': instance.lastUpdateAt.toIso8601String(),
    };

const _$StateEnumMap = {
  State.INAP: 'INAP',
  State.INAR: 'INAR',
  State.INAS: 'INAS',
  State.INBR: 'INBR',
  State.INCT: 'INCT',
  State.INGA: 'INGA',
  State.INGJ: 'INGJ',
  State.INHR: 'INHR',
  State.INHP: 'INHP',
  State.INJH: 'INJH',
  State.INKA: 'INKA',
  State.INKL: 'INKL',
  State.INMP: 'INMP',
  State.INMH: 'INMH',
  State.INMN: 'INMN',
  State.INML: 'INML',
  State.INMZ: 'INMZ',
  State.INNL: 'INNL',
  State.INOR: 'INOR',
  State.INPB: 'INPB',
  State.INRJ: 'INRJ',
  State.INSK: 'INSK',
  State.INTN: 'INTN',
  State.INTG: 'INTG',
  State.INTR: 'INTR',
  State.INUP: 'INUP',
  State.INUT: 'INUT',
  State.INWB: 'INWB',
  State.INCH: 'INCH',
  State.INLD: 'INLD',
  State.INDL: 'INDL',
  State.INPY: 'INPY',
};

const _$ProductStockStatusEnumMap = {
  ProductStockStatus.available: 'available',
  ProductStockStatus.outOfStock: 'outOfStock',
  ProductStockStatus.unavailable: 'unavailable',
};

ProductUnit _$ProductUnitFromJson(Map<String, dynamic> json) => ProductUnit._(
      (json['quantity'] as num).toDouble(),
      json['unitName'] as String,
      json['unitSymbol'] as String,
      dimension: _$recordConvertNullable(
        json['dimension'],
        ($jsonValue) => (
          h: ($jsonValue['h'] as num).toDouble(),
          l: ($jsonValue['l'] as num).toDouble(),
          w: ($jsonValue['w'] as num).toDouble(),
        ),
      ),
      dimensionMeasurement: $enumDecodeNullable(
          _$LengthMeasurementEnumMap, json['dimensionMeasurement']),
    );

Map<String, dynamic> _$ProductUnitToJson(ProductUnit instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'unitName': instance.unitName,
      'unitSymbol': instance.unitSymbol,
      'dimension': instance.dimension == null
          ? null
          : {
              'h': instance.dimension!.h,
              'l': instance.dimension!.l,
              'w': instance.dimension!.w,
            },
      'dimensionMeasurement':
          _$LengthMeasurementEnumMap[instance.dimensionMeasurement],
    };

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);

const _$LengthMeasurementEnumMap = {
  LengthMeasurement.cm: 'cm',
  LengthMeasurement.m: 'm',
  LengthMeasurement.km: 'km',
  LengthMeasurement.inch: 'inch',
  LengthMeasurement.foot: 'foot',
};

DeliveryMetaData _$DeliveryMetaDataFromJson(Map<String, dynamic> json) =>
    DeliveryMetaData(
      shippingCost: (json['shippingCost'] as num?)?.toDouble() ?? 0,
      deliveryCost: (json['deliveryCost'] as num?)?.toDouble() ?? 0,
      deliveryEstimation:
          $enumDecode(_$DeliveryEstimationEnumMap, json['deliveryEstimation']),
    );

Map<String, dynamic> _$DeliveryMetaDataToJson(DeliveryMetaData instance) =>
    <String, dynamic>{
      'shippingCost': instance.shippingCost,
      'deliveryCost': instance.deliveryCost,
      'deliveryEstimation':
          _$DeliveryEstimationEnumMap[instance.deliveryEstimation]!,
    };

const _$DeliveryEstimationEnumMap = {
  DeliveryEstimation.oneToTwo: 'oneToTwo',
  DeliveryEstimation.twoToThree: 'twoToThree',
  DeliveryEstimation.fiveToSeven: 'fiveToSeven',
  DeliveryEstimation.tenToFifteen: 'tenToFifteen',
};
