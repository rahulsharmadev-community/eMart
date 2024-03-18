import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:regpatterns/regpatterns.dart';
import 'general/typedef.dart';
import 'general/address.dart';
import 'package:uuid/uuid.dart';

part '../shop.g.dart';

// Class for representing abstract shop information fetched from the server
// This class is used only for reading or fetching shop data from the server
@JsonSerializable(constructor: '_')
class AbstractShopInfo {
  final String shopId;
  final String name;
  final String profileImg;
  final String gstNumber;
  final Address address;
  final String email;
  final String phoneNumber;
  final double rating;
  final bool isVerifiedShop;
  final DateTime createdAt;

  const AbstractShopInfo._(
    this.shopId,
    this.profileImg,
    this.name,
    this.address,
    this.gstNumber,
    this.email,
    this.phoneNumber,
    this.rating,
    this.isVerifiedShop,
    this.createdAt,
  );

  factory AbstractShopInfo.fromJson(JSON json) => _$AbstractShopInfoFromJson(json);
  JSON toJson() => _$AbstractShopInfoToJson(this);
}

@CopyWith()
@JsonSerializable()
class Shop {
  /// Shop Class: Represents a real shop owned by a seller.\
  /// This class facilitates the creation, reading, and updating of shop data on the server.
  Shop({
    String? shopId,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.profileImg,
    this.gstNumber,
    this.panNumber,
    this.gstDocImg,
    this.panDocImg,
    this.electricityBillDocImg,
    this.rating = 0.0,
    this.electricityBillNumber,
    this.isVerifiedShop = false,
    this.shopImgs = const [],
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : assert(sellerId.length > 8, 'Invalid seller id.'),
        assert(RegPatterns.email.hasMatch(email), 'Invalid email.'),
        assert(rating >= 0 && rating <= 5, 'Invalid rating. Rating should be between 0 and 5.'),
        assert(RegPatterns.phone.hasMatch(phoneNumber), 'Invalid phone number.'),
        assert(gstDocImg == null || Uri.parse(gstDocImg).isAbsolute, 'Invalid gstDocImg URL.'),
        assert(panDocImg == null || Uri.parse(panDocImg).isAbsolute, 'Invalid panDocImg URL.'),
        assert(electricityBillDocImg == null || Uri.parse(electricityBillDocImg).isAbsolute,
            'Invalid electricityBillDocImg URL.'),
        assert(shopImgs == null || shopImgs.every((e) => Uri.parse(e).isAbsolute),
            'Invalid image URL in shopImgs.'),
        shopId = shopId ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @CopyWithField.immutable()
  final String shopId;
  @CopyWithField.immutable()
  final String sellerId;

  final String profileImg;
  final String name;
  final Address address;
  final String email;
  final String phoneNumber;

  /// Represents the rating of the shop, indicating its overall performance or customer satisfaction.The rating should be within the range of 0.0 to 5.0, inclusive.
  final double rating;

  /// The Goods and Services Tax (GST) number associated with the shop, if applicable. This identifier is used for taxation purposes.
  final String? gstNumber;
  final String? gstDocImg;

  /// The Permanent Account Number (PAN) associated with the shop, if applicable. PAN is a unique alphanumeric identifier for taxation.
  final String? panNumber;
  final String? panDocImg;

  final List<String>? shopImgs;
  final bool isVerifiedShop;
  final String? electricityBillDocImg;

  /// The electricity bill number associated with the shop, providing a reference for the electricity bill documentation.
  final String? electricityBillNumber;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Shop.fromJson(JSON json) => _$ShopFromJson(json);
  JSON toJson() => _$ShopToJson(this);
}
