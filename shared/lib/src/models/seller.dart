import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';

part 'seller.g.dart';

enum SellerType { retailer, distributor, wholesaler }

@CopyWith()
@defJsonSerializable
class Seller extends Employee {
  Seller({
    super.uid,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required this.sellerType,
    required super.panNumber,
    required super.address,
    super.profileImg,
    this.isVerified = false,
    this.shopIds = const [],
    super.createdAt,
    super.lastUpdateAt,
  }) : super(role: EmployeeRole.primaryOwner);

  /// A boolean indicating whether the seller is verified.
  final bool isVerified;

  /// indicating the type of the seller (retailer, distributor, wholesaler).
  final SellerType sellerType;

  /// List of shop shopId associated with the seller, may a seller have more then one shop
  final List<String> shopIds;

  factory Seller.fromJson(JSON json) => _$SellerFromJson(json);

  @override
  JSON toJson() => _$SellerToJson(this);
}
