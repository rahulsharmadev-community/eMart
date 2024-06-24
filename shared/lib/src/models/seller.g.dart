// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SellerCWProxy {
  Seller uid(String? uid);

  Seller name(PersonName name);

  Seller email(Email email);

  Seller phoneNumber(PhoneNumber phoneNumber);

  Seller sellerType(SellerType sellerType);

  Seller panNumber(String panNumber);

  Seller address(Address address);

  Seller profileImg(String? profileImg);

  Seller isVerified(bool isVerified);

  Seller shopIds(List<String> shopIds);

  Seller createdAt(DateTime? createdAt);

  Seller lastUpdateAt(DateTime? lastUpdateAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Seller(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Seller(...).copyWith(id: 12, name: "My name")
  /// ````
  Seller call({
    String? uid,
    PersonName? name,
    Email? email,
    PhoneNumber? phoneNumber,
    SellerType? sellerType,
    String? panNumber,
    Address? address,
    String? profileImg,
    bool? isVerified,
    List<String>? shopIds,
    DateTime? createdAt,
    DateTime? lastUpdateAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSeller.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSeller.copyWith.fieldName(...)`
class _$SellerCWProxyImpl implements _$SellerCWProxy {
  const _$SellerCWProxyImpl(this._value);

  final Seller _value;

  @override
  Seller uid(String? uid) => this(uid: uid);

  @override
  Seller name(PersonName name) => this(name: name);

  @override
  Seller email(Email email) => this(email: email);

  @override
  Seller phoneNumber(PhoneNumber phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  Seller sellerType(SellerType sellerType) => this(sellerType: sellerType);

  @override
  Seller panNumber(String panNumber) => this(panNumber: panNumber);

  @override
  Seller address(Address address) => this(address: address);

  @override
  Seller profileImg(String? profileImg) => this(profileImg: profileImg);

  @override
  Seller isVerified(bool isVerified) => this(isVerified: isVerified);

  @override
  Seller shopIds(List<String> shopIds) => this(shopIds: shopIds);

  @override
  Seller createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Seller lastUpdateAt(DateTime? lastUpdateAt) =>
      this(lastUpdateAt: lastUpdateAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Seller(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Seller(...).copyWith(id: 12, name: "My name")
  /// ````
  Seller call({
    Object? uid = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? sellerType = const $CopyWithPlaceholder(),
    Object? panNumber = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
    Object? isVerified = const $CopyWithPlaceholder(),
    Object? shopIds = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? lastUpdateAt = const $CopyWithPlaceholder(),
  }) {
    return Seller(
      uid: uid == const $CopyWithPlaceholder()
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as PersonName,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as Email,
      phoneNumber:
          phoneNumber == const $CopyWithPlaceholder() || phoneNumber == null
              ? _value.phoneNumber
              // ignore: cast_nullable_to_non_nullable
              : phoneNumber as PhoneNumber,
      sellerType:
          sellerType == const $CopyWithPlaceholder() || sellerType == null
              ? _value.sellerType
              // ignore: cast_nullable_to_non_nullable
              : sellerType as SellerType,
      panNumber: panNumber == const $CopyWithPlaceholder() || panNumber == null
          ? _value.panNumber
          // ignore: cast_nullable_to_non_nullable
          : panNumber as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address,
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
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      lastUpdateAt: lastUpdateAt == const $CopyWithPlaceholder()
          ? _value.lastUpdateAt
          // ignore: cast_nullable_to_non_nullable
          : lastUpdateAt as DateTime?,
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
      email: Email.fromJson(json['email'] as String),
      phoneNumber: PhoneNumber.fromJson(json['phoneNumber'] as String),
      sellerType: $enumDecode(_$SellerTypeEnumMap, json['sellerType']),
      panNumber: json['panNumber'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      profileImg: json['profileImg'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      shopIds: (json['shopIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$SellerToJson(Seller instance) => <String, dynamic>{
      'uid': instance.uid,
      'profileImg': instance.profileImg,
      'name': instance.name.toJson(),
      'email': instance.email.toJson(),
      'phoneNumber': instance.phoneNumber.toJson(),
      'address': instance.address.toJson(),
      'panNumber': instance.panNumber,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
      'isVerified': instance.isVerified,
      'sellerType': _$SellerTypeEnumMap[instance.sellerType]!,
      'shopIds': instance.shopIds,
    };

const _$SellerTypeEnumMap = {
  SellerType.retailer: 'retailer',
  SellerType.distributor: 'distributor',
  SellerType.wholesaler: 'wholesaler',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
