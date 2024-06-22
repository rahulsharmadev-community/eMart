// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_role.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmployeeRoleCWProxy {
  EmployeeRole title(String title);

  EmployeeRole permissions(Set<PermissionType> permissions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmployeeRole(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmployeeRole(...).copyWith(id: 12, name: "My name")
  /// ````
  EmployeeRole call({
    String? title,
    Set<PermissionType>? permissions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEmployeeRole.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEmployeeRole.copyWith.fieldName(...)`
class _$EmployeeRoleCWProxyImpl implements _$EmployeeRoleCWProxy {
  const _$EmployeeRoleCWProxyImpl(this._value);

  final EmployeeRole _value;

  @override
  EmployeeRole title(String title) => this(title: title);

  @override
  EmployeeRole permissions(Set<PermissionType> permissions) =>
      this(permissions: permissions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmployeeRole(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmployeeRole(...).copyWith(id: 12, name: "My name")
  /// ````
  EmployeeRole call({
    Object? title = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
  }) {
    return EmployeeRole(
      title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      permissions == const $CopyWithPlaceholder() || permissions == null
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as Set<PermissionType>,
    );
  }
}

extension $EmployeeRoleCopyWith on EmployeeRole {
  /// Returns a callable class that can be used as follows: `instanceOfEmployeeRole.copyWith(...)` or like so:`instanceOfEmployeeRole.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmployeeRoleCWProxy get copyWith => _$EmployeeRoleCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeRole _$EmployeeRoleFromJson(Map<String, dynamic> json) => EmployeeRole(
      json['title'] as String,
      (json['permissions'] as List<dynamic>)
          .map((e) => $enumDecode(_$PermissionTypeEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$EmployeeRoleToJson(EmployeeRole instance) =>
    <String, dynamic>{
      'title': instance.title,
      'permissions':
          instance.permissions.map((e) => _$PermissionTypeEnumMap[e]!).toList(),
    };

const _$PermissionTypeEnumMap = {
  PermissionType.transferPrimaryOwnership: 'transferPrimaryOwnership',
  PermissionType.editAccountCredential: 'editAccountCredential',
  PermissionType.deleteAccount: 'deleteAccount',
  PermissionType.marketing: 'marketing',
  PermissionType.roleManagement: 'roleManagement',
  PermissionType.inventoryManagement: 'inventoryManagement',
  PermissionType.ordersManagement: 'ordersManagement',
  PermissionType.returnRefundManagement: 'returnRefundManagement',
  PermissionType.customerServiceManagement: 'customerServiceManagement',
  PermissionType.customerServiceMonitoring: 'customerServiceMonitoring',
  PermissionType.inventoryMonitoring: 'inventoryMonitoring',
  PermissionType.ordersMonitoring: 'ordersMonitoring',
  PermissionType.returnRefundMonitoring: 'returnRefundMonitoring',
};
