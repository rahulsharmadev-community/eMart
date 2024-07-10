// ignore_for_file: unused_element
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:razorpay_api/razorpay_api.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/const/applogo.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';

typedef PaymentState = BlocState<Order>;
typedef PaymentInital = BlocStateInitial<Order>;
typedef PaymentSuccess = BlocStateSuccess<Order>;
typedef PaymentInProgress = BlocStateLoading<Order>;
typedef PaymentFailure = BlocStateFailure<Order>;

class PaymentBloc extends Cubit<PaymentState> {
  final OrderApi orderApi;
  final PrimaryUserBloc bloc;
  final RazorPayAPI razorPayAPI;

  Consumer get user => bloc.primaryUser!.user;

  PaymentBloc(this.orderApi, this.bloc)
      : razorPayAPI = RazorPayAPI(),
        super(PaymentInital());

  onTapCODPaymentButton({required List<OrderedProduct> products}) {
    return user.primaryAddress.ifNotNull(
      def: null,
      callback: (value) async {
        try {
          emit(const PaymentInProgress('Initiating your order...'));
          var order = Order(
            consumerId: user.uid,
            products: products,
            defaultDeliveryAddress: value,
            paymentMode: 'cod',
          );
          await orderApi.createOrder(order);
          bloc.add(PrimaryUserEvent.update(
            (e) => e.copyWith.orders([...e.orders, order.orderId]),
          ));
          emit(PaymentSuccess(order));
        } catch (e) {
          const message = 'Failed to create an order! Please try agin.';
          emit(const PaymentFailure(message));
        }
      },
    );
  }

  VoidCallback? onTapOnlinePaymentButton({
    required List<OrderedProduct> products,
    RazorPayCheckOutTheme? razorPayTheme,
  }) {
    return user.primaryAddress.ifNotNull(
        def: null,
        callback: (value) {
          return () async {
            try {
              emit(const PaymentInProgress('Initiating your order...'));

              var orderId = await orderApi.placingPrePaidOrder(
                amount: products.calcaulateFinalPrice,
                consumerId: user.uid,
                products: products.map((e) => e.productId).toList(),
              );

              bloc.add(PrimaryUserEvent.update((e) => e.copyWith.orders([...e.orders, orderId])));

              emit(const PaymentInProgress('Order created successfully'));

              razorPayAPI.handler(
                (r) => _handlePaymentSuccess(r, value, products),
                _handlePaymentError,
                _handleExternalWallet,
              );

              razorPayAPI.checkout(RazorpayCheckout(
                  amount: products.calcaulateFinalPrice,
                  currency: RazorpayCurrency.INR,
                  prefill: Prefill(
                    name: user.name.toString(),
                    contact: user.phoneNumber?.value,
                    email: user.email?.value,
                  ),
                  name: eMart.name,
                  image: eMart.logoBase64,
                  readonly: Readonly(name: true, contact: true, email: true),
                  sendSmsHash: true,
                  theme: razorPayTheme,
                  rememberCustomer: true,
                  customerId: user.razorPayUid,
                  orderId: orderId,
                  timeout: 10.minutes,
                  externalWallet: [
                    'paytm',
                    'phonepe',
                    'amazonpay'
                  ],
                  notes: {
                    'uid': user.uid,
                    'pids': products.map((e) => e.productId).toList(),
                  }));
            } catch (e) {
              emit(PaymentFailure(e.toString()));
            }
          };
        });
  }

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
    Address defaultDeliveryAddress,
    List<OrderedProduct> products,
  ) async {
    try {
      var order = Order(
          orderId: response.orderId,
          consumerId: user.uid,
          products: products,
          paymentId: response.paymentId,
          signature: response.signature,
          defaultDeliveryAddress: defaultDeliveryAddress,
          paymentMode: 'razorpay');
      await orderApi.createOrder(order);
      emit(PaymentSuccess(order));
    } catch (e) {
      const message = 'Payment successfully but Order not created!\nPlease contect to support team';
      emit(const PaymentFailure(message));
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    emit(PaymentFailure(response.message ?? 'Payment failure'));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Future<void> close() {
    razorPayAPI.dispose();
    return super.close();
  }
}
