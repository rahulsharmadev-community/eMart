import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/jars_core.dart';
import 'package:jars/regpatterns.dart';
import 'package:shared/models.dart';
import 'package:shared/src/json_converters.dart';
import 'package:shared/src/utils/uidgenerator.dart';
import 'package:uuid/uuid.dart';
part 'shop.g.dart';

// Class for representing abstract shop information fetched from the server
// This class is used only for reading or fetching shop data from the server
@JsonSerializable(constructor: '_', explicitToJson: true)
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
@defJsonSerializable
class Shop with ValidatorMixin {
  /// Shop Class: Represents a real shop owned by a seller.\
  /// This class facilitates the creation, reading, and updating of shop data on the server.
  Shop({
    String? shopId,
    required this.ownerId,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.gstNumber,
    required this.panNumber,
    this.profileImg,
    this.employees = const [],
    this.gstDocImg,
    this.panDocImg,
    this.electricityBillDocImg,
    this.rating = 0.0,
    this.electricityBillNumber,
    this.isVerifiedShop = false,
    this.shopImgs = const [],
    this.afterSalesServices = const {},
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  })  : shopId = shopId ?? uidGenerator(prefix: 'shp', baseStr: ownerId),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @override
  void validator() {
    if (rating == null || rating! < 0 || rating! > 5) {
      throw ArgumentError('Rating must be between 0 and 5.');
    }

    name.regNotMatch(regPatterns.name, throwError: true);
    gstNumber.regNotMatch(regPatterns.gstNumber(typeRestriction: PanType.COMPANY), throwError: true);
    panNumber.regNotMatch(regPatterns.panNumber(typeRestriction: PanType.COMPANY), throwError: true);

    var urlpattern = regPatterns.url;
    profileImg?.regNotMatch(urlpattern, throwError: true);
    gstDocImg?.regNotMatch(urlpattern, throwError: true);
    panDocImg?.regNotMatch(urlpattern, throwError: true);
    electricityBillDocImg?.regNotMatch(urlpattern, throwError: true);
    electricityBillNumber?.regNotMatch(regPatterns.number(), throwError: true);

    if (rating == null || rating! < 0 || rating! > 5) {
      throw ArgumentError('Rating must be between 0 and 5.');
    }

    email.validator();
    phoneNumber.validator();
    address.validator();
  }

  @CopyWithField.immutable()
  final String shopId;
  @CopyWithField.immutable()
  final String ownerId;

  final String? profileImg;
  final String name;
  final Address address;
  final Email email;
  final PhoneNumber phoneNumber;

  /// Represents the rating of the shop, indicating its overall performance or customer satisfaction.The rating should be within the range of 0.0 to 5.0, inclusive.
  final double? rating;

  /// The Goods and Services Tax (GST) number associated with the shop, if applicable. This identifier is used for taxation purposes.
  final String gstNumber;
  final String? gstDocImg;

  /// The Permanent Account Number (PAN) associated with the shop, if applicable. PAN is a unique alphanumeric identifier for taxation.
  final String panNumber;
  final String? panDocImg;

  final List<String>? shopImgs;
  final bool isVerifiedShop;
  final String? electricityBillDocImg;

  /// The electricity bill number associated with the shop, providing a reference for the electricity bill documentation.
  final String? electricityBillNumber;

  /// Represents services applicable to products that have been sold.
  /// Sellers are permitted to create or read these services, but deletion is not allowed.
  final JSON<AfterSalesService> afterSalesServices;

  /// employees except owner of shop
  final List<String> employees;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Shop.fromJson(JSON json) => _$ShopFromJson(json);
  JSON toJson() => _$ShopToJson(this);
}
