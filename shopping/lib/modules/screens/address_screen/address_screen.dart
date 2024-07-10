import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/utility/extensions.dart';
import 'package:shopping/utility/routes/routes_initialise.dart';

class AddressScreen extends StatefulWidget {
  final String? oldAddressId;
  const AddressScreen({super.key, this.oldAddressId});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Future<bool?> confirmDismiss(DismissDirection direction) {
    return showDialog(
        context: context,
        builder: (_) {
          var main = context.colorScheme.error;
          return AlertJDialog(
            icon: Icon(
              Icons.delete_sweep_rounded,
              color: main,
            ),
            title: 'Delete Address',
            content: 'Are you sure you want to delete this address.',
            actions: [
              JButton(
                text: 'No',
                infinity: false,
                type: JButtonType.text,
                borderRadius: BorderRadius.circular(8),
                onPressed: () => context.pop(false),
              ).tightFit(),
              8.gap,
              JButton(
                text: 'Yes',
                infinity: false,
                borderRadius: BorderRadius.circular(8),
                onPressed: () => context.pop(true),
              ).tightFit(),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var user = context.select((PrimaryUserBloc value) => value.primaryUser!.user);
    var addresses = {...user.addresses};
    var rank1 = addresses.remove(user.primaryAddressId);
    var list = addresses.entries.toList();
    list.insert(0, MapEntry(rank1!.addressId, rank1));
    return Scaffold(
      appBar: AppBar(title: const Text('My Addresses')),
      body: ListView(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12), children: [
        JButton(
          leadingIcon: Icons.add_rounded,
          text: 'Add New Address',
          infinity: false,
          type: JButtonType.filled,
          borderRadius: BorderRadius.circular(8),
          onPressed: () => context.pushNamed(AppRoutes.EditAddressRoute.name),
        ),
        const Text('Save Addresses').paddingOnly(top: 16, bottom: 8),
        ListView.separated(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, i) => Dismissible(
              key: Key(list[i].key),
              direction: DismissDirection.endToStart,
              confirmDismiss: confirmDismiss,
              child: AddressTile(
                address: list[i].value,
              )),
          separatorBuilder: (context, i) => 8.gap,
        ),
      ]),
    );
  }
}

class AddressTile extends StatelessWidget {
  final model.Address address;
  const AddressTile({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    var regular = context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal);
    var medium = context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500);
    var isSelected = context.primaryUser.user.primaryAddressId == address.addressId;
    var color = isSelected ? context.colorScheme.primary : context.colorScheme.primaryContainer;

    return InkWell(
      onTap: () =>
          context.read<PrimaryUserBloc>().add(PrimaryUserEvent.changePrimaryAddress(address.addressId)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: color.withOpacity(0.2)),
            const BoxShadow(color: Colors.white),
          ],
          color: color.withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(children: [
            8.gap,
            leadingWdiget(context).squareBox(48),
            const VerticalDivider(indent: 10, endIndent: 10, width: 0),
            8.gap,
            Text.rich(TextSpan(children: [
              TextSpan(text: '${address.personName}\n', style: medium),
              TextSpan(text: '${address.phoneNumber}\n'.separate(min: 3), style: regular),
              TextSpan(text: address.formattedAddress, style: regular)
            ])).tightFit(),
            InkWell(
              onTap: () {
                context
                    .pushNamed(AppRoutes.EditAddressRoute.name, queryParameters: {'edit': address.addressId});
              },
              child: Icon(
                Icons.edit_location_alt_outlined,
                color: isSelected ? color : null,
              ).squareBox(48),
            )
          ]),
        ),
      ),
    );
  }

  Column leadingWdiget(BuildContext context) {
    return Column(
      children: [
        Icon(address.type?.icon),
        2.gap,
        Container(
            height: 18,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: context.colorScheme.secondaryContainer),
            child: Text('${address.type}').fittedBox())
      ],
    );
  }
}
