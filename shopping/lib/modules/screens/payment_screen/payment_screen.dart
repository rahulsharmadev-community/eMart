import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:razorpay_api/razorpay_api.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/core/blocs/products_cubit/products_cubit.dart';
import 'package:shopping/modules/widgets/delivery_tile.dart';
import 'package:shopping/modules/screens/payment_screen/payment_bloc/payment_bloc.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/utility/extensions.dart';
import 'package:shopping/utility/routes/app_routes.dart';

Future<T?> showPaymentBottomSheet<T>(context, JSON<int> cart) => showModalBottomSheet<T>(
    context: context,
    showDragHandle: true,
    isDismissible: false,
    isScrollControlled: true,
    clipBehavior: Clip.hardEdge,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
    builder: (context) => PaymentBottomSheet(cart: cart));

class PaymentBottomSheet extends StatefulWidget {
  final JSON<int> cart;

  const PaymentBottomSheet({super.key, required this.cart});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  late final PaymentBloc paymentBloc;
  late final List<model.OrderedProduct> products;
  late final StreamSubscription subscription;

  @override
  void initState() {
    paymentBloc = PaymentBloc(OrderApi(), context.read<PrimaryUserBloc>());
    subscription = paymentBloc.stream.listen(onStateChange);
    super.initState();
  }

  onStateChange(PaymentState state) {
    if (state is PaymentSuccess) {
      showJTost(context, msg: '✅ Payment Successfully');
      AppRoutes.pop();
    } else if (state is PaymentFailure) {
      showJTost(context,
          msg: state.message,
          config: JToastConfig(
              forgroundColor: context.theme.colorScheme.error,
              backgroundColor: context.theme.colorScheme.errorContainer));
      AppRoutes.pop();
    } else if (state is PaymentInProgress) {
      showJTost(context, msg: state.message ?? 'Please wait...');
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    paymentBloc.close();
    super.dispose();
  }

  Widget safteyText() => Text(
        'Safe and secure payments, Easy returns,100% Authentic products.',
        textAlign: TextAlign.center,
        style: context.textTheme.labelMedium,
      ).opacity(0.5).boxWidth(70.w);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: paymentBloc,
          ),
          BlocProvider(
            create: (context) => ProductsCubit()..fetchByIds(widget.cart.keys.toList(), disableCache: true),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DeliveryTile(),
              8.gap,
              const Divider(),
              BlocBuilder<ProductsCubit, ProductState>(builder: (context, state) {
                return state.on(
                  onSuccess: successfully,
                  onInitial: const JButton(
                      infinity: false,
                      child: SizedBox.square(dimension: 28, child: CircularProgressIndicator.adaptive())),
                  onFailure: (_) => const JButton(text: 'Try Again.'),
                );
              }),
              8.gap,
              safteyText(),
            ],
          ),
        ));
  }

  Widget successfully(ProductLoadedState state) {
    var products = state.data
        .map((e) => e.toOrderedProduct(widget.cart[e.productId]!, model.State.INDL, e.discountedPrice > 1000))
        .toList();
    var nf = const NumberFormat.en_in();
    var razorPayTheme = RazorPayCheckOutTheme(color: context.theme.cardColor);
    return Row(
      children: [
        SizedBox(
            width: 100,
            child: JButton(
              type: JButtonType.filled_tonal,
              text: 'COD',
              infinity: false,
              borderRadius: BorderRadius.circular(8),
            )),
        8.gap,
        JButton(
          text: 'PAY ${nf.simple(products.calcaulateFinalPrice, currencySymbol: true, trimZero: true)}',
          leadingIcon: Icons.assured_workload,
          infinity: false,
          borderRadius: BorderRadius.circular(8),
          onPressed: () {
            var address = context.primaryUser.user.primaryAddress;
            if (address != null) {
              paymentBloc.onTapOnlinePaymentButton(
                defaultDeliveryAddress: address,
                products: products,
                razorPayTheme: razorPayTheme,
              );
            }
          },
        ).tightFit()
      ],
    );
  }
}
