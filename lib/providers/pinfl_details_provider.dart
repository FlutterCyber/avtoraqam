import 'package:avtoraqam/models/pinfl_details_model.dart';
import 'package:flutter/material.dart';

class PinflDetailsProvider extends ChangeNotifier {
  String fio = "";
  String pinfl = "";
  String phoneNumber = "";
  String address = "";
  String birthDate = "";
  String sex = "";

  void setPinflDetails({required PinflDetailsModel pinflDetailsModel}) {
    fio = pinflDetailsModel.fio;
    pinfl = pinflDetailsModel.pinfl;
    phoneNumber = pinflDetailsModel.phoneNumber;
    address = pinflDetailsModel.address;
    birthDate = pinflDetailsModel.birthDate;
    sex = pinflDetailsModel.sex;
    notifyListeners();
  }
}
