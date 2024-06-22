// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PrimaryUserCWProxy {
  PrimaryUser user(Consumer user);

  PrimaryUser userActivity(UserActivity userActivity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PrimaryUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PrimaryUser(...).copyWith(id: 12, name: "My name")
  /// ````
  PrimaryUser call({
    Consumer? user,
    UserActivity? userActivity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPrimaryUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPrimaryUser.copyWith.fieldName(...)`
class _$PrimaryUserCWProxyImpl implements _$PrimaryUserCWProxy {
  const _$PrimaryUserCWProxyImpl(this._value);

  final PrimaryUser _value;

  @override
  PrimaryUser user(Consumer user) => this(user: user);

  @override
  PrimaryUser userActivity(UserActivity userActivity) =>
      this(userActivity: userActivity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PrimaryUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PrimaryUser(...).copyWith(id: 12, name: "My name")
  /// ````
  PrimaryUser call({
    Object? user = const $CopyWithPlaceholder(),
    Object? userActivity = const $CopyWithPlaceholder(),
  }) {
    return PrimaryUser(
      user: user == const $CopyWithPlaceholder() || user == null
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as Consumer,
      userActivity:
          userActivity == const $CopyWithPlaceholder() || userActivity == null
              ? _value.userActivity
              // ignore: cast_nullable_to_non_nullable
              : userActivity as UserActivity,
    );
  }
}

extension $PrimaryUserCopyWith on PrimaryUser {
  /// Returns a callable class that can be used as follows: `instanceOfPrimaryUser.copyWith(...)` or like so:`instanceOfPrimaryUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PrimaryUserCWProxy get copyWith => _$PrimaryUserCWProxyImpl(this);
}
