// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart' as model;
import 'package:shared_repositories/repositories.dart';
part 'form_state.dart';
part 'form_event.dart';

class FormBloc extends Bloc<FormEvent, RFormState> {
  final PlaceApi placeApi = const PlaceApi();
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCr;
  final TextEditingController phoneNumberCr;
  final TextEditingController floorCr;
  final TextEditingController houseNoCr;
  final TextEditingController areaCr;
  final TextEditingController cityCr;
  final TextEditingController pincodeCr;
  final TextEditingController landmarkCr;
  final TextEditingController panNumber;
  ValueNotifier<model.Employee> employee = ValueNotifier(model.Employee.dummy);
  model.AddressType type;
  FormBloc({model.Employee? inital})
      : formKey = GlobalKey<FormState>(),
        nameCr = TextEditingController(text: inital?.name.toString()),
        floorCr = TextEditingController(text: inital?.address?.floorLevel.toString()),
        houseNoCr = TextEditingController(text: inital?.address?.houseNo),
        areaCr = TextEditingController(text: inital?.address?.area),
        cityCr = TextEditingController(text: inital?.address?.city),
        pincodeCr = TextEditingController(text: inital?.address?.postalCode.toString()),
        landmarkCr = TextEditingController(text: inital?.address?.landmark),
        phoneNumberCr = TextEditingController(text: inital?.address?.phoneNumber.toString()),
        panNumber = TextEditingController(text: inital?.panNumber),
        type = inital?.address?.type ?? model.AddressType.business,
        super(FormIdleState()) {
    on<OnSubmit>((event, emit) => event.callback());

    on<FetchGeoCoordinate>((event, emit) {
      placeApi.googleGeoCoordinate(event.coordinate).then((value) {
        houseNoCr.text = '${value?[0].houseNumber ?? ''} ${value?[0].name ?? ''}'.trim();
        areaCr.text = value?[0].area ?? areaCr.text;
        cityCr.text = value?[0].city ?? cityCr.text;
        pincodeCr.text = value?[0].postalCode.toString() ?? pincodeCr.text;

        _result = _result.copyWith(
          country: value?[0].country ?? _result.country,
          district: value?[0].district ?? _result.district,
          geoCoordinate: value?[0].geoCoordinate ?? _result.geoCoordinate,
          plusCode: value?[0].plusCode ?? _result.plusCode,
          state: value?[0].state ?? _result.state,
        );
      }).catchError((e) {});
    });

    on<OnChange>((event, emit) {
      _updateResultValue();
      if ((formKey.currentState?.validate() ?? false)) {
        emit(FormReadyToSubmitState());
      } else {
        emit(FormIdleState());
      }
    });
  }

  model.Address _updateResultValue() {
    return _result = _result.copyWith(
      personName: model.PersonName.fromString(nameCr.text),
      floorLevel: int.tryParse(floorCr.text.trim()),
      houseNo: houseNoCr.text.trim(),
      area: areaCr.text.trim(),
      city: cityCr.text.trim(),
      postalCode: int.tryParse(pincodeCr.text.trim()),
      phoneNumber: int.tryParse(phoneNumberCr.text.trim()),
      landmark: landmarkCr.text.trim(),
      type: type.value,
    );
  }

  @override
  Future<void> close() {
    nameCr.dispose();
    floorCr.dispose();
    houseNoCr.dispose();
    areaCr.dispose();
    cityCr.dispose();
    pincodeCr.dispose();
    landmarkCr.dispose();
    phoneNumberCr.dispose();
    return super.close();
  }
}
