import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/utility/extensions.dart';
import 'package:shopping/utility/routes/app_routes.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({super.key});

  @override
  Widget build(BuildContext context) {
    var regular = context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal);
    var medium = context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500);

    var addresses =
        context.select((PrimaryUserBloc bloc) => bloc.primaryUser!.user.addresses).entries.toList();
    var user = context.primaryUser.user;

    if (addresses.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: JButton(
          text: 'Add Your Delivery Address!',
          onPressed: () => AppRoutes.EditAddressScreen.pushNamed(),
          type: JButtonType.filled_tonal,
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).boxHeight(kToolbarHeight),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        8.gap,
        Icon(user.primaryAddress?.type?.icon).squareBox(48),
        const VerticalDivider(indent: 10, endIndent: 10, width: 0),
        8.gap,
        Text.rich(TextSpan(children: [
          TextSpan(text: 'Deliver to: ${user.primaryAddress!.personName}\n', style: medium),
          TextSpan(text: user.primaryAddress?.formattedAddress ?? '', style: regular)
        ])).tightFit(),
        TextButton(
          child: const Text('Change'),
          onPressed: () => AppRoutes.AddressScreen.pushNamed(),
        )
      ]),
    );
  }
}
