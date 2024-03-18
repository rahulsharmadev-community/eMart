import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:regpatterns/regpatterns.dart';
import 'package:shared/models.dart';
import 'package:uuid/uuid.dart';

part '../seller.g.dart';

enum SellerType { retailer, distributor, wholesaler }

@CopyWith()
@JsonSerializable()
class Seller {
  Seller({
    String? uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.sellerType,
    this.panNumber,
    this.address,
    this.profileImg,
    this.isVerified = false,
    this.shopIds = const [],
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : assert(RegPatterns.email.hasMatch(email), 'Invalid email.'),
        assert(RegPatterns.phone.hasMatch(phoneNumber), 'Invalid phone number.'),
        uid = uid ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  /// Unique Identification numbers
  @CopyWithField.immutable()
  final String uid;

  /// Optional profile image URL
  final String? profileImg;

  /// Seller's name represented as a PersonName object
  final PersonName name;

  /// Seller's email address
  final String email;

  /// Seller phone number
  final String phoneNumber;

  /// Seller residential address
  final Address? address;

  /// A boolean indicating whether the seller is verified.
  final bool isVerified;

  /// indicating the type of the seller (retailer, distributor, wholesaler).
  final SellerType sellerType;

  /// List of shop shopId associated with the seller, may a seller have more then one shop
  final List<String> shopIds;

  /// The Permanent Account Number (PAN) associated with the seller.
  final String? panNumber;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Seller.fromJson(JSON json) => _$SellerFromJson(json);
  JSON toJson() => _$SellerToJson(this);
}
