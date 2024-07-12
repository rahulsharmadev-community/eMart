// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars_core.dart';
import 'package:shared/models.dart' as models;

class FormController {
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController panNumber = TextEditingController();
  final ValueNotifier<models.SellerType?> sellerType = ValueNotifier(null);

  final TextEditingController floor = TextEditingController();
  final TextEditingController houseNo = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController landmark = TextEditingController();

  JSON_1? country;
  JSON_1? state_;

  String? district;
  models.Email? email;
  GeoCoordinate? geoCoordinate;
  String? plusCode;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> canFormSubmit = ValueNotifier(false);

  final PageController pageCtrl = PageController(initialPage: 0);

  void onChanged() {
    canFormSubmit.value = name.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        panNumber.text.isNotEmpty &&
        sellerType.value != null &&
        houseNo.text.isNotEmpty &&
        area.text.isNotEmpty &&
        pincode.text.isNotEmpty &&
        (formKey.currentState?.validate() ?? false);
  }

  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    panNumber.dispose();
    sellerType.dispose();
    floor.dispose();

    houseNo.dispose();
    area.dispose();
    city.dispose();
    pincode.dispose();
    landmark.dispose();
    formKey.currentState?.dispose();
    canFormSubmit.dispose();

    pageCtrl.dispose();
  }

  void edit({
    String? name,
    String? floor,
    String? houseNo,
    String? area,
    String? city,
    String? pincode,
    String? landmark,
    String? phoneNumber,
    JSON_1? country,
    JSON_1? state_,
    String? panNumber,
    String? district,
    models.Email? email,
    GeoCoordinate? geoCoordinate,
    String? plusCode,
  }) {
    this.name.text = name ?? this.name.text;
    this.floor.text = floor ?? this.floor.text;
    this.houseNo.text = houseNo ?? this.houseNo.text;
    this.area.text = area ?? this.area.text;
    this.city.text = city ?? this.city.text;
    this.pincode.text = pincode ?? this.pincode.text;
    this.landmark.text = landmark ?? this.landmark.text;
    this.phoneNumber.text = phoneNumber ?? this.phoneNumber.text;
    this.panNumber.text = panNumber ?? this.panNumber.text;

    this.email = email ?? this.email;
    this.country = country ?? this.country;
    this.district = district ?? this.district;
    this.geoCoordinate = geoCoordinate ?? this.geoCoordinate;
    this.plusCode = plusCode ?? this.plusCode;
    this.state_ = state_ ?? this.state_;
  }
}
