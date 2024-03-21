import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared/src/helper.dart';
import 'package:shared/src/models/general/durationperiod.dart';
import 'states.dart';
import 'general/typedef.dart';
import 'package:uuid/uuid.dart';
part 'product.g.dart';

enum ProductStockStatus { available, outOfStock, unavailable }

@CopyWith()
@defJson
class Product {
  Product({
    String? productId,
    required this.shopId,
    required this.mrp,
    required this.title,
    required this.thumbnail,
    required this.unit,
    this.productBrand,
    this.shotDescription,
    this.warrantyPeriod,
    this.replacement,
    this.refund,
    this.afterSalesService,
    this.discount = 0,
    this.feature = const [],
    this.imageUrls = const [],
    this.variants = const [],
    this.category = const [],
    this.keywords = const [],
    this.detailedSpecs = const {},
    this.deliveryMetaData = const {},
    this.status = ProductStockStatus.available,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : assert(shopId.length > 8, 'Invalid Seller ID.'),
        assert(mrp > 0, 'MRP must be greater than zero.'),
        assert(title.length >= 3 && title.length <= 50, 'Title should be between 3 and 50 characters.'),
        assert(Uri.parse(thumbnail).isAbsolute, 'Invalid thumbnail URL.'),
        assert((discount >= 0 && discount <= 100), 'Discount should be between 0 and 100.'),
        assert(shotDescription == null || shotDescription.length > 30,
            'Shot description should be more than 30 characters.'),
        assert(imageUrls.every((e) => Uri.parse(e).isAbsolute), 'Invalid image URL in imageUrls.'),
        productId = productId ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @CopyWithField.immutable()
  final String productId; // Product Unique Identification numbers

  @CopyWithField.immutable()
  final String shopId;

  final String title;

  /// Product cover image
  final String thumbnail;

  /// List of categories the product belongs to.
  final List<String> category;

  /// Short description of the product.
  final String? shotDescription;

  /// Keywords associated with the product.
  final List<String> keywords;

  ///(lazy load) Brand of the product.
  final String? productBrand;

  /// Maximum retail price of the product.
  final double mrp;

  ///(lazy load) List of URLs for additional images.
  final List<String> imageUrls;

  ///(lazy load) slightly different form product
  final List<String> variants;

  ///(lazy load) Warranty information for the product.
  final DurationPeriod? warrantyPeriod;

  ///(lazy load) List of features or specifications of the product.
  final List<String>? feature;

  ///(lazy load) Represents a unit of measurement for a product, including quantity, dimension, and symbol.
  final ProductUnit unit;

  ///(lazy load) Detailed specifications of the product.
  final JSON<String> detailedSpecs;

  /// (lazy load)
  final DurationPeriod? replacement;

  /// (lazy load)
  final DurationPeriod? refund;

  /// (lazy load)
  final AfterSalesService? afterSalesService;

  /// (lazy load)
  final ProductStockStatus status;

  /// Discount applicable to the
  final double discount;

  ///(lazy load)
  final Map<State, DeliveryMetaData> deliveryMetaData;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Product.fromJson(JSON json) => _$ProductFromJson(json);
  JSON toJson() => _$ProductToJson(this);
}

enum LengthMeasurement { cm, m, km, inch, foot }

@JsonSerializable(constructor: '_', explicitToJson: true)
class ProductUnit {
  ProductUnit._(
    this.quantity,
    this.unitName,
    this.unitSymbol, {
    this.dimension,
    this.dimensionMeasurement,
  });

  final double quantity;
  final String unitName;
  final String unitSymbol;
  final Dimension? dimension;
  final LengthMeasurement? dimensionMeasurement;

  factory ProductUnit.piece(double quantity,
          {Dimension? dimension, LengthMeasurement? dimensionMeasurement}) =>
      ProductUnit._(quantity, 'Piece', 'piece',
          dimension: dimension, dimensionMeasurement: dimensionMeasurement);
  factory ProductUnit.kilogram(double quantity,
          {Dimension? dimension, LengthMeasurement? dimensionMeasurement}) =>
      ProductUnit._(quantity, 'Kilogram', 'kg',
          dimension: dimension, dimensionMeasurement: dimensionMeasurement);
  factory ProductUnit.gram(double quantity,
          {Dimension? dimension, LengthMeasurement? dimensionMeasurement}) =>
      ProductUnit._(quantity, 'Gram', 'g', dimension: dimension, dimensionMeasurement: dimensionMeasurement);
  factory ProductUnit.liter(double quantity,
          {Dimension? dimension, LengthMeasurement? dimensionMeasurement}) =>
      ProductUnit._(quantity, 'Liter', 'l', dimension: dimension, dimensionMeasurement: dimensionMeasurement);
  factory ProductUnit.meter(double quantity,
          {Dimension? dimension, LengthMeasurement? dimensionMeasurement}) =>
      ProductUnit._(quantity, 'Meter', 'm', dimension: dimension, dimensionMeasurement: dimensionMeasurement);

  factory ProductUnit.fromJson(JSON json) => _$ProductUnitFromJson(json);
  JSON toJson() => _$ProductUnitToJson(this);
}

enum DeliveryEstimation {
  oneToTwo("1-2 days"),
  twoToThree("2-3 days"),
  fourToSeven("4-7 days"),
  tenToFifteen("10-15 days");

  const DeliveryEstimation(this.description);
  final String description;
}

@CopyWith()
@defJson
class DeliveryMetaData {
  /// The `ProductMetaData` class encapsulates essential information about a product.
  /// It includes the product's unique identifier (`productId`), discount, and optional details
  /// such as replacement, refund, and after-sales service durations.
  DeliveryMetaData({
    this.shippingCost = 0,
    this.deliveryCost = 0,
    required this.deliveryEstimation,
  });

  final double shippingCost;
  final double deliveryCost;
  final DeliveryEstimation deliveryEstimation;

  factory DeliveryMetaData.fromJson(JSON json) => _$DeliveryMetaDataFromJson(json);
  JSON toJson() => _$DeliveryMetaDataToJson(this);
}

@CopyWith()
@defJson
class AfterSalesService {
  /// [AfterSalesService] class represents information about after-sales services for a product.
  /// It includes details such as serviceId, serviceName, free call support, free technical support,
  /// repairing discount, and the duration period for the service.
  AfterSalesService({
    String? serviceId,
    required this.period,
    required this.serviceName,
    required this.freeCallSupport,
    required this.freeTechnicalSupport,
    this.repairingDiscount = 0.0,
  }) : serviceId = serviceId ?? const Uuid().v4();

  /// Unique identifier for the after-sales service.
  @CopyWithField(immutable: true)
  final String serviceId;

  /// Name of the after-sales service.
  final String serviceName;

  /// Indicates if free call support is provided.
  final bool freeCallSupport;

  /// Indicates if free technical support is provided.
  final bool freeTechnicalSupport;

  /// Discount applicable to repairing services.
  final double repairingDiscount;

  /// DurationPeriod instance representing the period of the after-sales service.
  final DurationPeriod period;

  factory AfterSalesService.fromJson(JSON json) => _$AfterSalesServiceFromJson(json);
  JSON toJson() => _$AfterSalesServiceToJson(this);
}
