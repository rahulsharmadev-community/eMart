import 'package:jars/jars.dart';
import 'package:flutter/material.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({super.key});

  @override
  Widget build(BuildContext context) {
    var regular = context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal);
    var medium = context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500);

    // var addresses = context.read<PrimaryUserBloc>().primaryUser!.addresses;
    var addresses = ['A-115, raja vihar'];
    if (addresses.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: JButton(
          text: 'Add Your Delivery Address!',
          onPressed: () {},
          type: JButtonType.outlined,
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).boxHeight(kToolbarHeight),
      );
    }
    var text = addresses.first;
    return SizedBox.fromSize(
      size: const Size.fromHeight(kToolbarHeight),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(children: [
            Text('Deliver to: ', style: regular),
            Text(text, maxLines: 1, overflow: TextOverflow.ellipsis, style: medium),
            const Spacer(),
            JButton(
              text: 'Change',
              onPressed: () {},
              type: JButtonType.outlined,
              margin: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(8),
            ).boxWidth(120),
          ]),
        ),
      ),
    );
  }
}
