import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:jars/jars.dart';
import 'package:razorpay_api/razorpay_api.dart';
import '/src/utils/error_handler.dart';
import 'package:shared/firebase_service.dart';
import 'package:shared/models.dart';

class OrderApi with CustomExceptionHandler {
  final cf.CollectionReference collection = FirebaseService.eMartMix.instanceOfFirestore.collection('ORDERS');

  Future<JSON<Order>> getByOrderIds(List<String> orderIds) async {
    var result = await collection
        .where(cf.FieldPath.documentId, whereIn: orderIds)
        .withConverter<JSON<Order>>(
            fromFirestore: (_, s) => {
                  for (var e in _.data()!.entries) ...{e.key: Order.fromJson(e.value)}
                },
            toFirestore: (_, s) => _.map((key, value) => MapEntry(key, value.toJson())))
        .get();

    return result.docs.first as JSON<Order>;
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

  Future<void> update(Order order) => collection.doc(order.paymentId).update(order.toJson());

  Future<void> createOrder(Order order) => collection
      .doc(order.paymentId)
      .withConverter<Order>(
        fromFirestore: (_, s) => Order.fromJson(_.data()!),
        toFirestore: (_, s) => _.toJson(),
      )
      .set(order);

  Future<String> placingPrePaidOrder({
    required String consumerId,
    required List<String> products,
    required double amount,
  }) async {
    var razorpayOrder = RazorPayOrder(
        amount: amount, currency: RazorpayCurrency.INR, notes: {'uid': consumerId, 'pids': products});

    var orderId = (await const RazorPayOrderAPI().createOrder(razorpayOrder))!.id;

    return orderId;
  }

  Future<OrderStatus?> cancellingOrder(String orderId,
      {String? reason, DeliveryStatus? deliveryStatus}) async {
    final newOrderStatus = OrderStatus.canceledByConsumer(
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
}
