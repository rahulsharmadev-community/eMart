// ignore_for_file: unused_element
import 'package:bloc/bloc.dart';
import 'package:jars/jars.dart';
import 'package:razorpay_api/razorpay_api.dart';
import 'package:repositories/repositories.dart';
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

  // on<onTapCODPaymentButton>((event, emit) {});

  Future<void> onTapOnlinePaymentButton({
    required Address defaultDeliveryAddress,
    required List<OrderedProduct> products,
    RazorPayCheckOutTheme? razorPayTheme,
  }) async {
    defaultDeliveryAddress;
    try {
      emit(const PaymentInProgress('Initiating your order...'));

      var orderId = await orderApi.placingOrder(
        amount: products.calcaulateFinalPrice,
        consumerId: user.uid,
        products: products.map((e) => e.productId).toList(),
      );

      bloc.add(PrimaryUserEvent.update((e) => e.copyWith.orders([...e.orders, orderId])));

      emit(const PaymentInProgress('Order created successfully'));

      razorPayAPI.handler(
        (r) => _handlePaymentSuccess(r, defaultDeliveryAddress, products),
        _handlePaymentError,
        _handleExternalWallet,
      );

      razorPayAPI.checkout(RazorpayCheckout(
          amount: products.calcaulateFinalPrice,
          currency: RazorpayCurrency.INR,
          prefill: Prefill(
            name: user.name.toString(),
            contact: user.phoneNumber,
            email: user.email,
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
      emit(PaymentFailure('Failed to create order: ${e.toString()}'));
    }
  }

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
    Address defaultDeliveryAddress,
    List<OrderedProduct> products,
  ) {
    var order = Order(
        orderId: response.orderId,
        consumerId: user.uid,
        products: products,
        paymentId: response.paymentId,
        signature: response.signature,
        defaultDeliveryAddress: defaultDeliveryAddress,
        paymentMode: 'razorpay');
    orderApi.create(order).then((_) => emit(PaymentSuccess(order)));
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
