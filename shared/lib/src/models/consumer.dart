// ignore_for_file: unused_element

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/src/json_converters.dart';
import 'package:shared/models.dart';
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
class Consumer {
  Consumer({
    String? uid,
    required this.name,
    required this.fCMid,
    required this.devices,
    this.profileImg,
    this.email,
    this.phoneNumber,
    this.cartProducts = const {},
    this.wishlist = const {},
    this.complains = const [],
    this.orders = const [],
    this.addresses = const [],
    DateTime? joinAt,
    DateTime? lastUpdateAt,
  })  : assert(name.firstName.isNotEmpty, 'name should not be empty.'),
        assert(!(email == null && phoneNumber == null), 'email or phoneNumber should not be empty.'),
        uid = uid ?? const Uuid().v4(),
        joinAt = joinAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  /// Unknown user which represents an unauthenticated user.
  factory Consumer.unknown({required String fCMid, required JSON deviceInfo}) => Consumer(
      uid: '@unknown',
      name: PersonName(firstName: '@unknown', middleName: '@unknown', lastName: '@unknown'),
      email: '@unknown',
      fCMid: fCMid,
      devices: [deviceInfo]);

  /// Convenience getter to determine whether the current user is Unknown.
  bool get isUnknown => uid == '@unknown';

  @CopyWithField.immutable()
  final String uid;
  final PersonName name;
  final String? email;
  final String? phoneNumber;
  final String? profileImg;
  final String fCMid;

  final List<JSON> devices;

  /// Map of product IDs to their quantities in the user's cart.
  final JSON<int> cartProducts;

  /// Map of wishlist IDs to their respective data.
  final JSON<Wishlist> wishlist;

  final List<String> complains;
  final List<String> orders;
  final List<String> addresses;

  @CopyWithField.immutable()
  final DateTime joinAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Consumer.fromJson(JSON json) => _$ConsumerFromJson(json);
  JSON toJson() => _$ConsumerToJson(this);

  @override
  // TODO: implement hashCode
  int get hashCode => lastUpdateAt.hashCode;

  @override
  bool operator ==(Object other) {
    return super == other && other is Consumer && lastUpdateAt.hashCode == other.lastUpdateAt.hashCode;
  }
}

@CopyWith()
@defJsonSerializable
class Wishlist {
  Wishlist({
    required this.productIds,
    required this.name,
    String? wishlistId,
    DateTime? lastUpdateAt,
    DateTime? createdAt,
  })  : wishlistId = const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastUpdateAt = lastUpdateAt ?? DateTime.now();

  @CopyWithField.immutable()
  final String wishlistId;

  /// A map of product IDs to the time when they were added.
  final Map<String, DateTime> productIds;

  final String name;

  @CopyWithField.immutable()
  final DateTime createdAt;

  @CopyWithField.removable()
  final DateTime lastUpdateAt;

  factory Wishlist.fromJson(JSON json) => _$WishlistFromJson(json);
  JSON toJson() => _$WishlistToJson(this);
}
