// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SellerCWProxy {
  Seller name(PersonName name);

  Seller email(String email);

  Seller phoneNumber(String phoneNumber);

  Seller sellerType(SellerType sellerType);

  Seller panNumber(String? panNumber);

  Seller address(Address? address);

  Seller profileImg(String? profileImg);

  Seller isVerified(bool isVerified);

  Seller shopIds(List<String> shopIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Seller(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Seller(...).copyWith(id: 12, name: "My name")
  /// ````
  Seller call({
    PersonName? name,
    String? email,
    String? phoneNumber,
    SellerType? sellerType,
    String? panNumber,
    Address? address,
    String? profileImg,
    bool? isVerified,
    List<String>? shopIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSeller.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSeller.copyWith.fieldName(...)`
class _$SellerCWProxyImpl implements _$SellerCWProxy {
  const _$SellerCWProxyImpl(this._value);

  final Seller _value;

  @override
  Seller name(PersonName name) => this(name: name);

  @override
  Seller email(String email) => this(email: email);

  @override
  Seller phoneNumber(String phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  Seller sellerType(SellerType sellerType) => this(sellerType: sellerType);

  @override
  Seller panNumber(String? panNumber) => this(panNumber: panNumber);

  @override
  Seller address(Address? address) => this(address: address);

  @override
  Seller profileImg(String? profileImg) => this(profileImg: profileImg);

  @override
  Seller isVerified(bool isVerified) => this(isVerified: isVerified);

  @override
  Seller shopIds(List<String> shopIds) => this(shopIds: shopIds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Seller(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Seller(...).copyWith(id: 12, name: "My name")
  /// ````
  Seller call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? sellerType = const $CopyWithPlaceholder(),
    Object? panNumber = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
    Object? isVerified = const $CopyWithPlaceholder(),
    Object? shopIds = const $CopyWithPlaceholder(),
  }) {
    return Seller(
      uid: _value.uid,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as PersonName,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      phoneNumber:
          phoneNumber == const $CopyWithPlaceholder() || phoneNumber == null
              ? _value.phoneNumber
              // ignore: cast_nullable_to_non_nullable
              : phoneNumber as String,
      sellerType:
          sellerType == const $CopyWithPlaceholder() || sellerType == null
              ? _value.sellerType
              // ignore: cast_nullable_to_non_nullable
              : sellerType as SellerType,
      panNumber: panNumber == const $CopyWithPlaceholder()
          ? _value.panNumber
          // ignore: cast_nullable_to_non_nullable
          : panNumber as String?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address?,
      profileImg: profileImg == const $CopyWithPlaceholder()
          ? _value.profileImg
          // ignore: cast_nullable_to_non_nullable
          : profileImg as String?,
      isVerified:
          isVerified == const $CopyWithPlaceholder() || isVerified == null
              ? _value.isVerified
              // ignore: cast_nullable_to_non_nullable
              : isVerified as bool,
      shopIds: shopIds == const $CopyWithPlaceholder() || shopIds == null
          ? _value.shopIds
          // ignore: cast_nullable_to_non_nullable
          : shopIds as List<String>,
      createdAt: _value.createdAt,
    );
  }
}

extension $SellerCopyWith on Seller {
  /// Returns a callable class that can be used as follows: `instanceOfSeller.copyWith(...)` or like so:`instanceOfSeller.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SellerCWProxy get copyWith => _$SellerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seller _$SellerFromJson(Map<String, dynamic> json) => Seller(
      uid: json['uid'] as String?,
      name: PersonName.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      sellerType: $enumDecode(_$SellerTypeEnumMap, json['sellerType']),
      panNumber: json['panNumber'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      profileImg: json['profileImg'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      shopIds: (json['shopIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUpdateAt: json['lastUpdateAt'] == null
          ? null
          : DateTime.parse(json['lastUpdateAt'] as String),
    );

Map<String, dynamic> _$SellerToJson(Seller instance) => <String, dynamic>{
      'uid': instance.uid,
      'profileImg': instance.profileImg,
      'name': instance.name.toJson(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address?.toJson(),
      'isVerified': instance.isVerified,
      'sellerType': _$SellerTypeEnumMap[instance.sellerType]!,
      'shopIds': instance.shopIds,
      'panNumber': instance.panNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUpdateAt': instance.lastUpdateAt.toIso8601String(),
    };

const _$SellerTypeEnumMap = {
  SellerType.retailer: 'retailer',
  SellerType.distributor: 'distributor',
  SellerType.wholesaler: 'wholesaler',
};
