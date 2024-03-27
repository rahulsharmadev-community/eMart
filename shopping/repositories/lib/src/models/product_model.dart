import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
import "package:shared/models.dart";
part 'product_model.g.dart';

@CopyWith(skipFields: true)
@JsonSerializable(explicitToJson: true)
class ProductModel extends Product {
  final ProductMetaData reviewMetaData;
  
  @CopyWithField.immutable()
  final DateTime expiry;
  ProductModel({
    required super.productId,
    required super.shopId,
    required super.mrp,
    required super.title,
    required super.thumbnail,
    required super.unit,
    super.productBrand,
    super.shotDescription,
    super.warrantyPeriod,
    super.replacement,
    super.refund,
    super.afterSalesServiceId,
    super.discount,
    super.feature,
    super.imageUrls,
    super.variants,
    super.category,
    super.keywords,
    super.detailedSpecs,
    super.deliveryMetaData,
    super.status,
    super.createdAt,
    super.lastUpdateAt,
    this.reviewMetaData = const ProductMetaData(),
  }) : expiry = DateTime.now().add(2.minutes);

  factory ProductModel.fromJson(JSON json) => _$ProductModelFromJson(json);

  @override
  JSON toJson() => _$ProductModelToJson(this);
}
