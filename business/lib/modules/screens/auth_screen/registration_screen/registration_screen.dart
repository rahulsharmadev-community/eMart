import 'package:business/modules/screens/auth_screen/auth_cubit/auth_cubit.dart';
import 'package:business/modules/screens/auth_screen/registration_screen/bloc/form_bloc.dart';
import 'package:business/modules/screens/auth_screen/widgets/google_oauth_button.dart';
import 'package:business/services/geolocator_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';

class RegistrationScreen extends StatefulWidget {
  final User user;
  const RegistrationScreen({super.key, required this.user});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final FormBloc bloc;

  void nextFocus() => FocusScope.of(context).nextFocus();
  @override
  void initState() {
    bloc = FormBloc();
    GeolocatorService.determinePosition().then((x) {
      bloc.add(FetchGeoCoordinate(x.geoCoordinate));
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildFormContext(),
              const Row(
                children: [
                  Spacer(),
                  TextButton(onPressed: null, child: Text('Help')),
                  TextButton(onPressed: null, child: Text('Privacy')),
                  TextButton(onPressed: null, child: Text('*T&C Apply')),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  Container buildFormContext() {
    var theme = Theme.of(context).primaryTextTheme;
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create Seller Account',
            style: theme.titleMedium,
          ),
          8.gap,
          Text(
            'Register as a seller on eMart and manage sales, inventory and your business operations on the Seller Central dashboard.',
            style: theme.titleMedium,
          ),
          24.gap,
          JTextField(
            controller: bloc.nameCr,
            labelText: 'Full Name',
            hintText: 'eg. Rahul Sharma',
            keyboardType: TextInputType.name,
            validatorPattern: RegPatterns.username(allowSpace: true, maxLength: 30),
            onDone: nextFocus,
            isDense: false,
          ),
          JTextField(
              controller: bloc.phoneNumberCr,
              labelText: 'Phone Number',
              hintText: 'eg. 9876543210',
              keyboardType: TextInputType.phone,
              maxLength: 10,
              onDone: nextFocus,
              isDense: false,
              validatorPattern: RegPatterns.number(minLength: 8, maxLength: 10)),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            JTextField(
              controller: bloc.houseNoCr,
              labelText: 'House/Building No.',
              hintText: 'eg. A-223',
              keyboardType: TextInputType.streetAddress,
              maxLength: 72,
              onDone: nextFocus,
              isDense: false,
            ).tightFit(3),
            12.gap,
            JTextField(
              controller: bloc.floorCr,
              labelText: 'Floor',
              hintText: 'eg. 4',
              suffixText: 'Floor',
              maxLength: 2,
              keyboardType: TextInputType.number,
              validatorPattern: RegPatterns.number(maxLength: 2, minLength: 1),
              onDone: nextFocus,
              isDense: false,
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
                isDense: false,
              ).tightFit(3),
              12.gap,
              JTextField(
                controller: bloc.pincodeCr,
                labelText: 'Pincode',
                hintText: 'eg. 110059',
                keyboardType: TextInputType.number,
                validatorPattern: RegPatterns.postalCode(),
                onDone: nextFocus,
                isDense: false,
              ).tightFit(2),
            ],
          ),
          JTextField(
            controller: bloc.landmarkCr,
            labelText: 'Nearby Landmark',
            keyboardType: TextInputType.streetAddress,
            onDone: FocusScope.of(context).unfocus,
            isDense: false,
          ),
          16.gap,
          FilledButton(
            onPressed: onSubmit,
            child: const Text('Registor'),
          ),
        ],
      ),
    );
  }

  onSubmit() {
    var onSubmit = OnSubmit((x) => context
        .read<AuthCubit>()
        .createEmployee(name: x.personName, phoneNumber: x.phoneNumber, panNumber: x.plusCode, address: address,));
    context.read<FormBloc>().add(onSubmit);
  }
}
