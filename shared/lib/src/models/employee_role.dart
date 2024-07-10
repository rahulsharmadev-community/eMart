import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:jars/equatable.dart';
import 'package:jars/jars_core.dart';
import 'package:shared/src/json_converters.dart';
import 'package:shared/src/models/permission.dart';
part 'employee_role.g.dart';

@CopyWith()
@defJsonSerializable
class EmployeeRole extends Equatable {
  final String title;
  final Set<PermissionType> permissions;
  const EmployeeRole(this.title, this.permissions);

  bool hasPermission(PermissionType permission) => permissions.contains(permission);

  bool get isPrimaryOwner => primaryOwner == this;
  static final primaryOwner = EmployeeRole('Owner', PermissionType.values.toSet());

  bool get isOwner => owner == this;
  static final owner = EmployeeRole(
      'Owner',
      PermissionType.except({
        PermissionType.deleteAccount,
        PermissionType.editAccountCredential,
        PermissionType.transferPrimaryOwnership,
      }).toSet());

  bool get isBusinessAnalyst => businessAnalyst == this;
  static const businessAnalyst = EmployeeRole('Business Analyst', {
    PermissionType.ordersMonitoring,
    PermissionType.inventoryMonitoring,
    PermissionType.returnRefundMonitoring,
    PermissionType.customerServiceMonitoring,
  });

  bool get isSalesManager => salesManager == this;
  static const salesManager = EmployeeRole('Sales Manager', {
    PermissionType.ordersManagement,
    PermissionType.inventoryMonitoring,
  });

  @override
  List<Object?> get props => [title, permissions];

  factory EmployeeRole.fromJson(JSON json) => _$EmployeeRoleFromJson(json);

  JSON toJson() => _$EmployeeRoleToJson(this);
}
