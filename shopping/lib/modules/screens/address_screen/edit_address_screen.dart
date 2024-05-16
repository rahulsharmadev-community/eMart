import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/screens/address_screen/bloc/form_bloc.dart';
import 'package:shopping/modules/widgets/buttons/button.dart';
import 'package:shopping/services/geolocator_service.dart';
import 'package:shopping/utility/extensions.dart';

class EditAddressScreen extends StatefulWidget {
  final String? oldAddressId;
  const EditAddressScreen({super.key, this.oldAddressId});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late final FormBloc bloc;
  bool get isNewCreate => widget.oldAddressId == null;
  @override
  void initState() {
    super.initState();

    var user = context.primaryUser.user;
    var old = !isNewCreate ? user.addresses[widget.oldAddressId] : null;
    bloc = FormBloc(inital: old, placeApi: const PlaceApi());
    if (isNewCreate) actionNewAddressCreate();
  }

  actionNewAddressCreate() {
    var user = context.primaryUser.user;
    bloc.add(OverrideNamePhoneNo(user.name, user.phoneNumber));
    GeolocatorService.determinePosition().then((x) {
      bloc.add(FetchGeoCoordinate(x.geoCoordinate));
    });
  }

  void nextFocus() => FocusScope.of(context).nextFocus();
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = isNewCreate ? 'Add Address' : 'Edit Address';
    const caption =
        'Your address data is kept secure and private in our app, ensuring that your information is protected and used responsibly.';
    final buttonText = isNewCreate ? 'Save Address' : 'Update Address';

    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Builder(
          builder: (context) => FormBuilder(
              caption: caption,
              horizontalGap: 12,
              verticalGap: 12,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              formKey: bloc.formKey,
              onChanged: () => bloc.add(OnChange()),
              actions: [
                BlocBuilder<FormBloc, FormAddressState>(
                  builder: (context, state) {
                    return JButton(
                      onPressed: onSubmitButton(state, context),
                      infinity: false,
                      borderRadius: BorderRadius.circular(8),
                      child: Text(buttonText),
                    );
                  },
                ).tightFit(),
              ],
              children: [
                JTextField(
                  controller: bloc.nameCr,
                  labelText: 'Full Name',
                  hintText: 'eg. Rahul Sharma',
                  keyboardType: TextInputType.name,
                  validatorPattern: RegPatterns.username(allowSpace: true, maxLength: 30),
                  onDone: nextFocus,
                ),
                JTextField(
                  controller: bloc.phoneNumberCr,
                  labelText: 'Phone Number',
                  hintText: 'eg. 9876543210',
                  keyboardType: TextInputType.number,
                  onDone: nextFocus,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  JTextField(
                    controller: bloc.houseNoCr,
                    labelText: 'House/Building No.',
                    hintText: 'eg. A-223',
                    keyboardType: TextInputType.streetAddress,
                    maxLength: 72,
                    onDone: nextFocus,
                  ).tightFit(3),
                  JTextField(
                    controller: bloc.floorCr,
                    labelText: 'Floor',
                    hintText: 'eg. 4',
                    suffixText: 'Floor',
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    onDone: nextFocus,
                  ).tightFit(2),
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JTextField(
                      controller: bloc.areaCr,
                      labelText: 'Area',
                      hintText: 'eg. Rohini sec - 4',
                      keyboardType: TextInputType.name,
                      maxLength: 72,
                      onDone: nextFocus,
                    ).tightFit(3),
                    JTextField(
                      controller: bloc.pincodeCr,
                      labelText: 'Pincode',
                      hintText: 'eg. 110059',
                      keyboardType: TextInputType.number,
                      validatorPattern: RegPatterns.postalCode(),
                      onDone: nextFocus,
                    ).tightFit(2),
                  ],
                ),
                JTextField(
                  controller: bloc.landmarkCr,
                  labelText: 'Nearby Landmark',
                  keyboardType: TextInputType.streetAddress,
                  onDone: FocusScope.of(context).unfocus,
                ),
                const AddressTypeSelector(),
              ]),
        ),
      ),
    );
  }

  VoidCallback? onSubmitButton(FormAddressState state, BuildContext context) {
    var read = context.read<PrimaryUserBloc>();
    return state is FormReadyToSubmitState
        ? () {
            bloc.add(OnSubmit((address) {
              return read.add(PrimaryUserEvent.addOrEditAdderss(address,
                  makePrimery: context.primaryUser.user.addresses.isEmpty));
            }));
          }
        : null;
  }
}

class AddressTypeSelector extends StatelessWidget {
  const AddressTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    var type = context.read<FormBloc>().type;
    return ValueListenableBuilder(
      valueListenable: type,
      builder: (context, value, child) => ToggleButtons(
          onPressed: (int i) {
            type.value = model.AddressType.values[i];
            context.read<FormBloc>().add(OnChange());
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          // selectedBorderColor: Colors.red[700],
          // selectedColor: Colors.white,
          // fillColor: Colors.red[200],
          // color: Colors.red[400],
          constraints: const BoxConstraints(
            minHeight: 38,
            minWidth: 48,
          ),
          isSelected: model.AddressType.values.map((e) => e == value).toList(),
          children: model.AddressType.values
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(e.icon, size: 18),
                        4.gap,
                        Text('$e'),
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
