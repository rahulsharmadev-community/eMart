import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:jars/jars.dart';
import 'package:repositories/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';
import '../extenstion.dart';

class OrderRepository with CustomExceptionHandler {
  final cf.CollectionReference collection;
  OrderRepository({cf.FirebaseFirestore? firestore})
      : collection = FirebaseService.eMartMix.instanceOfFirestore.collection('ORDERS');

  JSON<Order> getAll() {
    return {};
  }

  Future<Order?> getByOrderId(String orderId) async {
    final resp = await collection
        .doc(orderId)
        .withConverter<Order>(
          fromFirestore: (_, s) => Order.fromJson(_.data()!),
          toFirestore: (_, s) => _.toJson(),
        )
        .get();
    return resp.data();
  }

  Future<void> placingOrder(Order order) async {
    return collection
        .doc(order.orderId)
        .withConverter<Order>(
          fromFirestore: (_, s) => Order.fromJson(_.data()!),
          toFirestore: (_, s) => _.toJson(),
        )
        .set(order);
  }

  Future<OrderStatus?> cancellingOrder(String orderId,
      {String? reason, DeliveryStatus? deliveryStatus}) async {
    final newOrderStatus = OrderStatus.canceledByConsumer(
      orderId: orderId,
      reason: reason,
      deliveryStatus: deliveryStatus,
    );
    try {
      await collection.doc(orderId).update({'orderStatus': newOrderStatus});
      return newOrderStatus;
    } catch (e) {
      logs.e(e);
    }
    return null;
  }

  modifyingOrder(Order order) {}
}
