// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShopCWProxy {
  Shop name(String name);

  Shop address(Address address);

  Shop email(String email);

  Shop phoneNumber(String phoneNumber);

  Shop profileImg(String profileImg);

  Shop gstNumber(String? gstNumber);

  Shop panNumber(String? panNumber);

  Shop gstDocImg(String? gstDocImg);

  Shop panDocImg(String? panDocImg);

  Shop electricityBillDocImg(String? electricityBillDocImg);

  Shop rating(double rating);

  Shop electricityBillNumber(String? electricityBillNumber);

  Shop isVerifiedShop(bool isVerifiedShop);

  Shop shopImgs(List<String>? shopImgs);

  Shop afterSalesServices(Map<String, AfterSalesService> afterSalesServices);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shop(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shop(...).copyWith(id: 12, name: "My name")
  /// ````
  Shop call({
    String? name,
    Address? address,
    String? email,
    String? phoneNumber,
    String? profileImg,
    String? gstNumber,
    String? panNumber,
    String? gstDocImg,
    String? panDocImg,
    String? electricityBillDocImg,
    double? rating,
    String? electricityBillNumber,
    bool? isVerifiedShop,
    List<String>? shopImgs,
    Map<String, AfterSalesService>? afterSalesServices,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShop.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShop.copyWith.fieldName(...)`
class _$ShopCWProxyImpl implements _$ShopCWProxy {
  const _$ShopCWProxyImpl(this._value);

  final Shop _value;

  @override
  Shop name(String name) => this(name: name);

  @override
  Shop address(Address address) => this(address: address);

  @override
  Shop email(String email) => this(email: email);

  @override
  Shop phoneNumber(String phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  Shop profileImg(String profileImg) => this(profileImg: profileImg);

  @override
  Shop gstNumber(String? gstNumber) => this(gstNumber: gstNumber);

  @override
  Shop panNumber(String? panNumber) => this(panNumber: panNumber);

  @override
  Shop gstDocImg(String? gstDocImg) => this(gstDocImg: gstDocImg);

  @override
  Shop panDocImg(String? panDocImg) => this(panDocImg: panDocImg);

  @override
  Shop electricityBillDocImg(String? electricityBillDocImg) =>
      this(electricityBillDocImg: electricityBillDocImg);

  @override
  Shop rating(double rating) => this(rating: rating);

  @override
  Shop electricityBillNumber(String? electricityBillNumber) =>
      this(electricityBillNumber: electricityBillNumber);

  @override
  Shop isVerifiedShop(bool isVerifiedShop) =>
      this(isVerifiedShop: isVerifiedShop);

  @override
  Shop shopImgs(List<String>? shopImgs) => this(shopImgs: shopImgs);

  @override
  Shop afterSalesServices(Map<String, AfterSalesService> afterSalesServices) =>
      this(afterSalesServices: afterSalesServices);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shop(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shop(...).copyWith(id: 12, name: "My name")
  /// ````
  Shop call({
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
    Object? gstNumber = const $CopyWithPlaceholder(),
    Object? panNumber = const $CopyWithPlaceholder(),
    Object? gstDocImg = const $CopyWithPlaceholder(),
    Object? panDocImg = const $CopyWithPlaceholder(),
    Object? electricityBillDocImg = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? electricityBillNumber = const $CopyWithPlaceholder(),
    Object? isVerifiedShop = const $CopyWithPlaceholder(),
    Object? shopImgs = const $CopyWithPlaceholder(),
    Object? afterSalesServices = const $CopyWithPlaceholder(),
  }) {
    return Shop(
      shopId: _value.shopId,
      sellerId: _value.sellerId,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      phoneNumber:
          phoneNumber == const $CopyWithPlaceholder() || phoneNumber == null
              ? _value.phoneNumber
              // ignore: cast_nullable_to_non_nullable
              : phoneNumber as String,
      profileImg:
          profileImg == const $CopyWithPlaceholder() || profileImg == null
              ? _value.profileImg
              // ignore: cast_nullable_to_non_nullable
              : profileImg as String,
      gstNumber: gstNumber == const $CopyWithPlaceholder()
          ? _value.gstNumber
          // ignore: cast_nullable_to_non_nullable
          : gstNumber as String?,
      panNumber: panNumber == const $CopyWithPlaceholder()
          ? _value.panNumber
          // ignore: cast_nullable_to_non_nullable
          : panNumber as String?,
      gstDocImg: gstDocImg == const $CopyWithPlaceholder()
          ? _value.gstDocImg
          // ignore: cast_nullable_to_non_nullable
          : gstDocImg as String?,
      panDocImg: panDocImg == const $CopyWithPlaceholder()
          ? _value.panDocImg
          // ignore: cast_nullable_to_non_nullable
          : panDocImg as String?,
      electricityBillDocImg:
          electricityBillDocImg == const $CopyWithPlaceholder()
              ? _value.electricityBillDocImg
              // ignore: cast_nullable_to_non_nullable
              : electricityBillDocImg as String?,
      rating: rating == const $CopyWithPlaceholder() || rating == null
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as double,
      electricityBillNumber:
          electricityBillNumber == const $CopyWithPlaceholder()
              ? _value.electricityBillNumber
              // ignore: cast_nullable_to_non_nullable
              : electricityBillNumber as String?,
      isVerifiedShop: isVerifiedShop == const $CopyWithPlaceholder() ||
              isVerifiedShop == null
          ? _value.isVerifiedShop
          // ignore: cast_nullable_to_non_nullable
          : isVerifiedShop as bool,
      shopImgs: shopImgs == const $CopyWithPlaceholder()
          ? _value.shopImgs
          // ignore: cast_nullable_to_non_nullable
          : shopImgs as List<String>?,
      afterSalesServices: afterSalesServices == const $CopyWithPlaceholder() ||
              afterSalesServices == null
          ? _value.afterSalesServices
          // ignore: cast_nullable_to_non_nullable
          : afterSalesServices as Map<String, AfterSalesService>,
      createdAt: _value.createdAt,
    );
  }
}

extension $ShopCopyWith on Shop {
  /// Returns a callable class that can be used as follows: `instanceOfShop.copyWith(...)` or like so:`instanceOfShop.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShopCWProxy get copyWith => _$ShopCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbstractShopInfo _$AbstractShopInfoFromJson(Map<String, dynamic> json) =>
    AbstractShopInfo._(
      json['shopId'] as String,
      json['profileImg'] as String,
      json['name'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      json['gstNumber'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
      (json['rating'] as num).toDouble(),
      json['isVerifiedShop'] as bool,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AbstractShopInfoToJson(AbstractShopInfo instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'name': instance.name,
      'profileImg': instance.profileImg,
      'gstNumber': instance.gstNumber,
      'address': instance.address.toJson(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'rating': instance.rating,
      'isVerifiedShop': instance.isVerifiedShop,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      shopId: json['shopId'] as String?,
      sellerId: json['sellerId'] as String,
      name: json['name'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImg: json['profileImg'] as String,
      gstNumber: json['gstNumber'] as String?,
      panNumber: json['panNumber'] as String?,
      gstDocImg: json['gstDocImg'] as String?,
      panDocImg: json['panDocImg'] as String?,
      electricityBillDocImg: json['electricityBillDocImg'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      electricityBillNumber: json['electricityBillNumber'] as String?,
      isVerifiedShop: json['isVerifiedShop'] as bool? ?? false,
      shopImgs: (json['shopImgs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      afterSalesServices:
          (json['afterSalesServices'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    k, AfterSalesService.fromJson(e as Map<String, dynamic>)),
              ) ??
              const {},
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUpdateAt: json['lastUpdateAt'] == null
          ? null
          : DateTime.parse(json['lastUpdateAt'] as String),
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'shopId': instance.shopId,
      'sellerId': instance.sellerId,
      'profileImg': instance.profileImg,
      'name': instance.name,
      'address': instance.address.toJson(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'rating': instance.rating,
      'gstNumber': instance.gstNumber,
      'gstDocImg': instance.gstDocImg,
      'panNumber': instance.panNumber,
      'panDocImg': instance.panDocImg,
      'shopImgs': instance.shopImgs,
      'isVerifiedShop': instance.isVerifiedShop,
      'electricityBillDocImg': instance.electricityBillDocImg,
      'electricityBillNumber': instance.electricityBillNumber,
      'afterSalesServices':
          instance.afterSalesServices.map((k, e) => MapEntry(k, e.toJson())),
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUpdateAt': instance.lastUpdateAt.toIso8601String(),
    };
