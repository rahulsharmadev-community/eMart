// ignore_for_file: unused_element

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/src/json_converters.dart';
import 'package:shared/models.dart';
import 'package:shared/src/models/general/contact.dart';
import 'package:uuid/uuid.dart';
import 'package:jars/jars.dart';

part 'consumer.g.dart';

@JsonSerializable(
  explicitToJson: true,
  constructor: '_',
  converters: [
    DateTimeConverter(),
    ColorConverter(),
  ],
)
class AbstractConsumerInfo {
  final String uid;
  final PersonName name;
  final String? email;
  final String? phoneNumber;
  final String? profileImg;

  const AbstractConsumerInfo._({
    required this.uid,
    required this.name,
    this.email,
    this.phoneNumber,
    this.profileImg,
  });

  factory AbstractConsumerInfo.fromJson(JSON json) => _$AbstractConsumerInfoFromJson(json);

  JSON toJson() => _$AbstractConsumerInfoToJson(this);
}

@defJsonSerializable
@CopyWith()
class Consumer extends Equatable with ValidatorMixin {
  Consumer({
    String? uid,
    required this.name,
    required this.fCMid,
    required this.devices,
    required this.email,
    this.profileImg,
    this.phoneNumber,
    this.gstNumber,
    this.cartProducts = const {},
    this.wishlist = const {},
    this.complains = const [],
    this.orders = const [],
    this.addresses = const {},
    this.primaryAddressId,
    this.razorPayUid,
    DateTime? joinAt,
    DateTime? lastUpdateAt,
  })  : uid = uid ?? const Uuid().v4(),
        joinAt = joinAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  /// Unknown user which represents an unauthenticated user.
  static Consumer unknown = Consumer(
      uid: '',
      name: const PersonName(firstName: '@unknown'),
      email: const Email('@unknown'),
      fCMid: '',
      devices: const []);

  /// Convenience getter to determine whether the current user is Unknown.
  bool get isUnknown => this == unknown;

  Address? get primaryAddress => primaryAddressId != null ? addresses[primaryAddressId] : null;

  JSON<Wishlist>? findWishlist(String pid) =>
      wishlist.entries.firstWhereOrNull((e) => e.value.productIds.containsKey(pid))?.map;

  @CopyWithField.immutable()
  final String uid;
  final PersonName name;
  final Email email;
  final PhoneNumber? phoneNumber;
  final String? profileImg;
  final String fCMid;
  final String? gstNumber;
  final String? razorPayUid;

  final String? primaryAddressId;

  final List<JSON> devices;

  final List<String> complains;
  final List<String> orders;

  /// key represent uniqe name for wishlist
  final JSON<Wishlist> wishlist;
  final JSON<Address> addresses;

  /// Map of product IDs to their quantities in the user's cart.
  final JSON<int> cartProducts;

  @CopyWithField.immutable()
  final DateTime joinAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Consumer.fromJson(JSON json) => _$ConsumerFromJson(json);

  JSON toJson() => _$ConsumerToJson(this);

  @override
  List<Object?> get props => [
        uid,
        name,
        fCMid,
        devices,
        profileImg,
        email,
        phoneNumber,
        gstNumber,
        cartProducts,
        wishlist,
        complains,
        orders,
        addresses,
        primaryAddressId,
        razorPayUid,
        joinAt,
        // ignore lastUpdateAt
      ];

  @override
  void validator() {
    RegPattern pattern = regPatterns.url;
    if (profileImg?.regNotMatch(pattern) ?? false) throw ArgumentError(pattern.message);

    pattern = regPatterns.gstNumber(typeRestriction: PanType.INDIVIDUAL_PERSON);
    if (gstNumber?.regNotMatch(pattern) ?? false) throw ArgumentError(pattern.message);

    name.validator();
    email.validator();
    phoneNumber?.validator();

    for (var address in addresses.values) {
      address.validator();
    }
  }
}

@CopyWith()
@defJsonSerializable
class Wishlist extends Equatable {
  Wishlist({
    required this.productIds,
    DateTime? lastUpdateAt,
    DateTime? createdAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  /// A map of product IDs to the time when they were added.
  final Map<String, DateTime> productIds;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Wishlist.fromJson(JSON json) => _$WishlistFromJson(json);

  JSON toJson() => _$WishlistToJson(this);

  @override
  List<Object?> get props => [productIds, createdAt];
}
