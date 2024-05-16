// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConsumerCWProxy {
  Consumer name(PersonName name);

  Consumer fCMid(String fCMid);

  Consumer devices(List<Map<String, dynamic>> devices);

  Consumer profileImg(String? profileImg);

  Consumer email(String? email);

  Consumer phoneNumber(String? phoneNumber);

  Consumer cartProducts(Map<String, int> cartProducts);

  Consumer wishlist(Map<String, Wishlist> wishlist);

  Consumer complains(List<String> complains);

  Consumer orders(List<String> orders);

  Consumer addresses(Map<String, Address> addresses);

  Consumer primaryAddressId(String? primaryAddressId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Consumer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Consumer(...).copyWith(id: 12, name: "My name")
  /// ````
  Consumer call({
    PersonName? name,
    String? fCMid,
    List<Map<String, dynamic>>? devices,
    String? profileImg,
    String? email,
    String? phoneNumber,
    Map<String, int>? cartProducts,
    Map<String, Wishlist>? wishlist,
    List<String>? complains,
    List<String>? orders,
    Map<String, Address>? addresses,
    String? primaryAddressId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConsumer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConsumer.copyWith.fieldName(...)`
class _$ConsumerCWProxyImpl implements _$ConsumerCWProxy {
  const _$ConsumerCWProxyImpl(this._value);

  final Consumer _value;

  @override
  Consumer name(PersonName name) => this(name: name);

  @override
  Consumer fCMid(String fCMid) => this(fCMid: fCMid);

  @override
  Consumer devices(List<Map<String, dynamic>> devices) =>
      this(devices: devices);

  @override
  Consumer profileImg(String? profileImg) => this(profileImg: profileImg);

  @override
  Consumer email(String? email) => this(email: email);

  @override
  Consumer phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  Consumer cartProducts(Map<String, int> cartProducts) =>
      this(cartProducts: cartProducts);

  @override
  Consumer wishlist(Map<String, Wishlist> wishlist) => this(wishlist: wishlist);

  @override
  Consumer complains(List<String> complains) => this(complains: complains);

  @override
  Consumer orders(List<String> orders) => this(orders: orders);

  @override
  Consumer addresses(Map<String, Address> addresses) =>
      this(addresses: addresses);

  @override
  Consumer primaryAddressId(String? primaryAddressId) =>
      this(primaryAddressId: primaryAddressId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Consumer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Consumer(...).copyWith(id: 12, name: "My name")
  /// ````
  Consumer call({
    Object? name = const $CopyWithPlaceholder(),
    Object? fCMid = const $CopyWithPlaceholder(),
    Object? devices = const $CopyWithPlaceholder(),
    Object? profileImg = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? cartProducts = const $CopyWithPlaceholder(),
    Object? wishlist = const $CopyWithPlaceholder(),
    Object? complains = const $CopyWithPlaceholder(),
    Object? orders = const $CopyWithPlaceholder(),
    Object? addresses = const $CopyWithPlaceholder(),
    Object? primaryAddressId = const $CopyWithPlaceholder(),
  }) {
    return Consumer(
      uid: _value.uid,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as PersonName,
      fCMid: fCMid == const $CopyWithPlaceholder() || fCMid == null
          ? _value.fCMid
          // ignore: cast_nullable_to_non_nullable
          : fCMid as String,
      devices: devices == const $CopyWithPlaceholder() || devices == null
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as List<Map<String, dynamic>>,
      profileImg: profileImg == const $CopyWithPlaceholder()
          ? _value.profileImg
          // ignore: cast_nullable_to_non_nullable
          : profileImg as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      cartProducts:
          cartProducts == const $CopyWithPlaceholder() || cartProducts == null
              ? _value.cartProducts
              // ignore: cast_nullable_to_non_nullable
              : cartProducts as Map<String, int>,
      wishlist: wishlist == const $CopyWithPlaceholder() || wishlist == null
          ? _value.wishlist
          // ignore: cast_nullable_to_non_nullable
          : wishlist as Map<String, Wishlist>,
      complains: complains == const $CopyWithPlaceholder() || complains == null
          ? _value.complains
          // ignore: cast_nullable_to_non_nullable
          : complains as List<String>,
      orders: orders == const $CopyWithPlaceholder() || orders == null
          ? _value.orders
          // ignore: cast_nullable_to_non_nullable
          : orders as List<String>,
      addresses: addresses == const $CopyWithPlaceholder() || addresses == null
          ? _value.addresses
          // ignore: cast_nullable_to_non_nullable
          : addresses as Map<String, Address>,
      primaryAddressId: primaryAddressId == const $CopyWithPlaceholder()
          ? _value.primaryAddressId
          // ignore: cast_nullable_to_non_nullable
          : primaryAddressId as String?,
      joinAt: _value.joinAt,
    );
  }
}

extension $ConsumerCopyWith on Consumer {
  /// Returns a callable class that can be used as follows: `instanceOfConsumer.copyWith(...)` or like so:`instanceOfConsumer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConsumerCWProxy get copyWith => _$ConsumerCWProxyImpl(this);
}

abstract class _$WishlistCWProxy {
  Wishlist productIds(Map<String, DateTime> productIds);

  Wishlist name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Wishlist(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Wishlist(...).copyWith(id: 12, name: "My name")
  /// ````
  Wishlist call({
    Map<String, DateTime>? productIds,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWishlist.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWishlist.copyWith.fieldName(...)`
class _$WishlistCWProxyImpl implements _$WishlistCWProxy {
  const _$WishlistCWProxyImpl(this._value);

  final Wishlist _value;

  @override
  Wishlist productIds(Map<String, DateTime> productIds) =>
      this(productIds: productIds);

  @override
  Wishlist name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Wishlist(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Wishlist(...).copyWith(id: 12, name: "My name")
  /// ````
  Wishlist call({
    Object? productIds = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Wishlist(
      productIds:
          productIds == const $CopyWithPlaceholder() || productIds == null
              ? _value.productIds
              // ignore: cast_nullable_to_non_nullable
              : productIds as Map<String, DateTime>,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      wishlistId: _value.wishlistId,
      createdAt: _value.createdAt,
    );
  }
}

extension $WishlistCopyWith on Wishlist {
  /// Returns a callable class that can be used as follows: `instanceOfWishlist.copyWith(...)` or like so:`instanceOfWishlist.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WishlistCWProxy get copyWith => _$WishlistCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbstractConsumerInfo _$AbstractConsumerInfoFromJson(
        Map<String, dynamic> json) =>
    AbstractConsumerInfo._(
      uid: json['uid'] as String,
      name: PersonName.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profileImg: json['profileImg'] as String?,
    );

Map<String, dynamic> _$AbstractConsumerInfoToJson(
        AbstractConsumerInfo instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name.toJson(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profileImg': instance.profileImg,
    };

Consumer _$ConsumerFromJson(Map<String, dynamic> json) => Consumer(
      uid: json['uid'] as String?,
      name: PersonName.fromJson(json['name'] as Map<String, dynamic>),
      fCMid: json['fCMid'] as String,
      devices: (json['devices'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      profileImg: json['profileImg'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      cartProducts: (json['cartProducts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          const {},
      wishlist: (json['wishlist'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Wishlist.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      complains: (json['complains'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      addresses: (json['addresses'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Address.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      primaryAddressId: json['primaryAddressId'] as String?,
      joinAt: _$JsonConverterFromJson<int, DateTime>(
          json['joinAt'], const DateTimeConverter().fromJson),
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$ConsumerToJson(Consumer instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name.toJson(),
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profileImg': instance.profileImg,
      'fCMid': instance.fCMid,
      'primaryAddressId': instance.primaryAddressId,
      'devices': instance.devices,
      'complains': instance.complains,
      'orders': instance.orders,
      'wishlist': instance.wishlist.map((k, e) => MapEntry(k, e.toJson())),
      'addresses': instance.addresses.map((k, e) => MapEntry(k, e.toJson())),
      'cartProducts': instance.cartProducts,
      'joinAt': const DateTimeConverter().toJson(instance.joinAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Wishlist _$WishlistFromJson(Map<String, dynamic> json) => Wishlist(
      productIds: (json['productIds'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, const DateTimeConverter().fromJson(e as int)),
      ),
      name: json['name'] as String,
      wishlistId: json['wishlistId'] as String?,
      lastUpdateAt: _$JsonConverterFromJson<int, DateTime>(
          json['lastUpdateAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$WishlistToJson(Wishlist instance) => <String, dynamic>{
      'wishlistId': instance.wishlistId,
      'productIds': instance.productIds
          .map((k, e) => MapEntry(k, const DateTimeConverter().toJson(e))),
      'name': instance.name,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'lastUpdateAt': const DateTimeConverter().toJson(instance.lastUpdateAt),
    };
