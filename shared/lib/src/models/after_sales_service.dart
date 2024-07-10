import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/jars_core.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';
import 'package:uuid/uuid.dart';
import 'package:jars/regpatterns.dart';
part 'after_sales_service.g.dart';

@CopyWith()
@defJsonSerializable
class AfterSalesService with ValidatorMixin {
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
  @CopyWithField.immutable()
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

  @override
  void validator() {
    if (repairingDiscount < 0 || repairingDiscount > 100) {
      throw ArgumentError('The invalid repair discount should fall between 0 and 100.');
    }
    var pattern = regPatterns.username(allowSpace: true);
    if (serviceName.regNotMatch(pattern)) {
      throw ArgumentError(pattern.message);
    }
  }
}
