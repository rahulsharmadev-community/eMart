// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:logger/logger.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart' as model;
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
part 'form_address_state.dart';
part 'form_event.dart';

class FormBloc extends Bloc<FormEvent, FormAddressState> {
  final PlaceApi placeApi;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCr;
  final TextEditingController phoneNumberCr;
  final TextEditingController floorCr;
  final TextEditingController houseNoCr;
  final TextEditingController areaCr;
  final TextEditingController cityCr;
  final TextEditingController pincodeCr;
  final TextEditingController landmarkCr;
  ValueNotifier<model.AddressType?> type;
  model.Address _result;

  FormBloc({model.Address? inital, required this.placeApi})
      : _result = inital ?? model.Address.empty,
        formKey = GlobalKey<FormState>(),
        nameCr = TextEditingController(text: inital?.personName.toString()),
        floorCr = TextEditingController(text: inital?.floorLevel.toString()),
        houseNoCr = TextEditingController(text: inital?.houseNo),
        areaCr = TextEditingController(text: inital?.area),
        cityCr = TextEditingController(text: inital?.city),
        pincodeCr = TextEditingController(text: inital?.postalCode.toString()),
        landmarkCr = TextEditingController(text: inital?.landmark),
        phoneNumberCr = TextEditingController(text: inital?.landmark),
        type = ValueNotifier(inital?.type),
        super(FormIdleState()) {
    on<OnSubmit>((event, emit) => event.callback(_result));

    on<OverrideNamePhoneNo>((event, emit) {
      nameCr.text = event.name.toString();
      phoneNumberCr.text = event.phoneNumber ?? phoneNumberCr.text;
    });

    on<FetchGeoCoordinate>((event, emit) {
      emit(FormFetchCompleteState());
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
        emit(FormFetchCompleteState());
      }).catchError((e) {});
    });

    on<OnChange>((event, emit) {
      _updateResultValue();
      if (type.value != null &&
          (inital != _result) &&
          (_result.isNotEmpty) &&
          (formKey.currentState?.validate() ?? false)) {
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
    // ignore: invalid_use_of_protected_member
    formKey.currentState?.dispose();
    nameCr.dispose();
    floorCr.dispose();
    houseNoCr.dispose();
    areaCr.dispose();
    cityCr.dispose();
    pincodeCr.dispose();
    landmarkCr.dispose();
    return super.close();
  }
}
