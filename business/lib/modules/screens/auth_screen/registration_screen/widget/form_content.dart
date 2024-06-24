part of '../registration_screen.dart';

class FormContent extends StatelessWidget {
  const FormContent({super.key});

  @override
  Widget build(BuildContext context) {
    var formCtrl = context.read<RegistrationFormBloc>().formCtrl;
    var pageCtrl = formCtrl.pageCtrl;
    return Form(
      key: formCtrl.formKey,
      onChanged: formCtrl.onChanged,
      child: PageView(
        controller: pageCtrl,
        children: const [
          FormPage1(),
          FormPage2(),
        ],
      ),
    );
  }
}

/*
_________________________________________________FormPage1___________________________________________________
*/
class FormPage1 extends StatefulWidget {
  const FormPage1({super.key});

  @override
  State<FormPage1> createState() => _FormPage1State();
}

class _FormPage1State extends State<FormPage1> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegistrationFormBloc>();
    var formCtrl = bloc.formCtrl;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.gap,
            JTextField(
              labelText: 'Full Name',
              hintText: 'eg. Rahul Sharma',
              controller: formCtrl.name,
              keyboardType: TextInputType.name,
              validatorPattern: regPatterns.name,
              textInputAction: TextInputAction.next,
              isDense: false,
              onDone: FocusScope.of(context).nextFocus,
            ),
            16.gap,
            JTextField(
                labelText: 'Phone Number',
                hintText: 'eg. 9876543210',
                controller: formCtrl.phoneNumber,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                textInputAction: TextInputAction.next,
                isDense: false,
                onDone: FocusScope.of(context).nextFocus,
                validatorPattern: regPatterns.phoneNumber),
            16.gap,
            JTextField(
                labelText: 'PAN Number',
                hintText: 'eg. ABCTY1234D',
                controller: formCtrl.panNumber,
                keyboardType: TextInputType.text,
                maxLength: 10,
                textInputAction: TextInputAction.done,
                isDense: false,
                onDone: FocusScope.of(context).nextFocus,
                validatorPattern: regPatterns.panNumber()),
            16.gap,
            Text('Seller Type', style: context.textTheme.titleMedium),
            4.gap,
            const AddressTypeSelector(),
            32.gap,
            Align(
              alignment: Alignment.topRight,
              child: FilledButton(
                autofocus: true,
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                onPressed: bloc.onTapNext,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
_________________________________________________FormPage2___________________________________________________
*/
class FormPage2 extends StatefulWidget {
  const FormPage2({super.key});

  @override
  State<FormPage2> createState() => _FormPage2State();
}

class _FormPage2State extends State<FormPage2> {
  @override
  void initState() {
    GeolocatorService.determinePosition().then((x) {
      context.read<RegistrationFormBloc>().fetchGeoCoordinate(x.geoCoordinate);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegistrationFormBloc>();
    var formCtrl = bloc.formCtrl;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            16.gap,
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              JTextField(
                controller: formCtrl.houseNo,
                labelText: 'House/Building No.',
                hintText: 'eg. A-223',
                keyboardType: TextInputType.streetAddress,
                maxLength: 72,
                textInputAction: TextInputAction.next,
                isDense: false,
              ).tightFit(3),
              16.gap,
              JTextField(
                controller: formCtrl.floor,
                labelText: 'Floor',
                hintText: 'eg. 4',
                suffixText: 'Floor',
                maxLength: 2,
                keyboardType: TextInputType.number,
                validatorPattern: regPatterns.number(maxLength: 2, minLength: 1),
                textInputAction: TextInputAction.next,
                isDense: false,
              ).tightFit(1),
            ]),
            16.gap,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JTextField(
                  controller: formCtrl.area,
                  labelText: 'Area',
                  hintText: 'eg. Rohini sec - 4',
                  keyboardType: TextInputType.name,
                  maxLength: 72,
                  textInputAction: TextInputAction.next,
                  isDense: false,
                ).tightFit(3),
                16.gap,
                JTextField(
                  controller: formCtrl.pincode,
                  labelText: 'Pincode',
                  hintText: 'eg. 110059',
                  keyboardType: TextInputType.number,
                  validatorPattern: regPatterns.postalCode(),
                  textInputAction: TextInputAction.next,
                  isDense: false,
                ).tightFit(1),
              ],
            ),
            16.gap,
            JTextField(
              controller: formCtrl.landmark,
              labelText: 'Nearby Landmark (Optional)',
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.done,
              isDense: false,
            ),
            32.gap,
            const FormButton()
          ],
        ),
      ),
    );
  }
}

/*
_________________________________________________Helper-Widgets___________________________________________________
*/
class FormButton extends StatelessWidget {
  const FormButton({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegistrationFormBloc>();
    var formCtrl = bloc.formCtrl;
    var styleFrom =
        FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
    return BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
      builder: (context, state) {
        if (state is FormLoadingState) return const LoadingWidget();
        return ValueListenableBuilder(
          valueListenable: formCtrl.canFormSubmit,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: bloc.onTapBack, child: const Text('back')),
                FilledButton(
                  autofocus: true,
                  style: styleFrom,
                  onPressed: value ? bloc.onSubmit : null,
                  child: const Text('Registor'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class AddressTypeSelector extends StatelessWidget {
  const AddressTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<RegistrationFormBloc>().formCtrl;
    var type = ctrl.sellerType;
    return ValueListenableBuilder(
      valueListenable: type,
      builder: (context, value, child) => ToggleButtons(
          onPressed: (int i) {
            ctrl.sellerType.value = models.SellerType.values[i];
            ctrl.onChanged();
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
          isSelected: models.SellerType.values.map((e) => e == value).toList(),
          children: models.SellerType.values
              .map((e) => Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text(e.name)))
              .toList()),
    );
  }
}
