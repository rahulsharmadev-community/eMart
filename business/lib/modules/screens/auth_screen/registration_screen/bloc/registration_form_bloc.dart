// ignore_for_file: prefer_final_fields

import 'package:business/modules/screens/auth_screen/registration_screen/bloc/form_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart' as model;
import 'package:shared_repositories/repositories.dart';
part 'form_state.dart';

class RegistrationFormBloc extends Cubit<RegistrationFormState> {
  final User user;
  final PlaceApi placeApi = const PlaceApi();
  final EmployeesApi employeesApi = EmployeesApi();
  final FormController formCtrl;

  RegistrationFormBloc({required this.user})
      : formCtrl = FormController(),
        super(FormIdleState()) {
    formCtrl.name.text = user.displayName ?? '';
    formCtrl.phoneNumber.text = user.phoneNumber ?? '';
  }
  var animDuration = 300.milliseconds;
  var animCurve = Curves.decelerate;

  void onTapNext() {
    formCtrl.pageCtrl.nextPage(duration: animDuration, curve: animCurve);
  }

  void onTapBack() {
    formCtrl.pageCtrl.previousPage(duration: animDuration, curve: animCurve);
  }

  void onSubmit() async {
    try {
      var seller = model.Seller(
          uid: user.uid,
          name: model.PersonName.fromString(formCtrl.name.text),
          email: model.Email(user.email!),
          phoneNumber: model.PhoneNumber(formCtrl.phoneNumber.text),
          sellerType: formCtrl.sellerType.value!,
          panNumber: formCtrl.panNumber.text,
          profileImg: user.photoURL,
          address: model.Address(
            houseNo: formCtrl.houseNo.text,
            postalCode: formCtrl.pincode.text,
            plusCode: formCtrl.plusCode,
            geoCoordinate: formCtrl.geoCoordinate,
            state: formCtrl.state_ ?? (key: 'null', value: 'null'),
            country: formCtrl.country ?? (key: 'null', value: 'null'),
            floorLevel: int.tryParse(formCtrl.floor.text),
            area: formCtrl.area.text,
            district: formCtrl.district,
            city: formCtrl.city.text,
          ));
      if (seller.isValid(true)) {
        emit(FormLoadingState());
        await employeesApi.createNewEmployee(seller);
        emit(FormSubmitedSuccessState());
      }
    } catch (e) {
      emit(FormErrorState('$e'));
    }
  }

  bool isfetchGeo = false;
  void fetchGeoCoordinate(GeoCoordinate coordinate) async {
    if (isfetchGeo) return;
    try {
      var list = await placeApi.geoapifyGeoCoordinate(coordinate);
      var temp = list?[0];
      formCtrl.edit(
        houseNo: '${temp?.houseNumber ?? ''} ${temp?.name ?? ''}'.trim(),
        area: temp?.area,
        city: temp?.city,
        pincode: temp?.postalCode.toString(),
        country: temp?.country,
        district: temp?.district,
        geoCoordinate: temp?.geoCoordinate,
        plusCode: temp?.plusCode,
        state_: temp?.state,
      );
      isfetchGeo = true;
    } catch (e) {
      Logger().e(e);
    }
  }

  @override
  Future<void> close() {
    formCtrl.dispose();
    return super.close();
  }
}
