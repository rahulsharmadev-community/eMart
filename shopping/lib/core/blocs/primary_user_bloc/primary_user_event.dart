part of 'primary_user_bloc.dart';

@immutable
sealed class PrimaryUserEvent {
  static PrimaryUserDispose dispose() => PrimaryUserDispose();
  static UpdateUserEvent update(Consumer Function(Consumer value) consumer) => UpdateUserEvent(consumer);

  static UpdateUserEvent cartProductIncrement(String productId, [int by = 1]) => update((value) {
        var count = value.cartProducts[productId] ?? 0;
        count += by;
        return value.copyWith.cartProducts({...value.cartProducts, productId: count});
      });
  static UpdateUserEvent cartProductDecrement(String productId, [int by = 1]) => update((value) {
        var count = value.cartProducts[productId] ?? 0;
        count -= by;
        if (count == 0) return value;
        return value.copyWith.cartProducts({...value.cartProducts, productId: count});
      });

  static UpdateUserEvent cartProductRemove(String productId, [int by = 1]) => update((value) {
        return value.copyWith.cartProducts(value.cartProducts..remove(productId));
      });

  static UpdateUserEvent removeFromWishlist(String wishlistId, String productId) => update((value) {
        var oldValue = value.wishlist[wishlistId];
        if (oldValue == null) return value;

        var productIds = oldValue.productIds..remove(productId);
        var newValue = oldValue.copyWith.productIds(productIds);
        return value.copyWith.wishlist({...value.wishlist, newValue.wishlistId: newValue});
      });

  static UpdateUserEvent createWishlist(String name, [List<String> productIds = const []]) => update((value) {
        final now = DateTime.now();
        final wishlist = Wishlist(
          productIds: {for (var e in productIds) e: now},
          name: name,
          lastUpdateAt: now,
          createdAt: now,
        );
        return value.copyWith.wishlist({...value.wishlist, wishlist.wishlistId: wishlist});
      });

  static UpdateUserEvent deleteWishlist(String wishlistId) => update((value) {
        return value.copyWith.wishlist(value.wishlist..remove(wishlistId));
      });

  static UpdateUserEvent addToWishlist(String wishlistId, String productId) => update((value) {
        var oldValue = value.wishlist[wishlistId];
        if (oldValue == null) return value;

        var newValue = oldValue.copyWith.productIds({...oldValue.productIds, productId: DateTime.now()});
        return value.copyWith.wishlist({...value.wishlist, newValue.wishlistId: newValue});
      });
}

class PrimaryUserDispose extends PrimaryUserEvent {}

class UpdateUserEvent extends PrimaryUserEvent {
  final Consumer Function(Consumer value) consumer;

  UpdateUserEvent(this.consumer);
}

class AddVisitedProductEvent extends PrimaryUserEvent {
  final String productId;

  AddVisitedProductEvent(this.productId);
}

class AddSuggestionKeywordsEvent extends PrimaryUserEvent {
  final List<String> keywords;

  AddSuggestionKeywordsEvent(this.keywords);
}
