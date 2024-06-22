enum PermissionType {
  transferPrimaryOwnership, // Transfer primary ownership of accounts or assets
  editAccountCredential,
  deleteAccount, // Delete accounts or related data

  marketing, // Manage marketing: update images, descriptions, features, etc.

  roleManagement, // Update or create roles within the organization
  inventoryManagement, // Manage inventory: update product information
  ordersManagement, // Manage orders: update order status, etc.
  returnRefundManagement, // Manage returns and refunds
  customerServiceManagement, // Handle customer inquiries and issues

  customerServiceMonitoring, // Monitor inquiries and issues
  inventoryMonitoring, // Monitor inventory levels and trends
  ordersMonitoring, // Monitor orders and their status
  returnRefundMonitoring; // Monitor returns and refunds

  static List<PermissionType> except(Set<PermissionType> list) {
    var temp = [...PermissionType.values];
    // ignore: avoid_function_literals_in_foreach_calls
    list.forEach((e) => temp.remove(e));
    return temp;
  }
}
