import 'package:avtoraqam/models/car_details_model.dart';
import 'package:flutter/material.dart';

class CarDetailsProvider extends ChangeNotifier {
  String fio = "";
  String pinfl = "";
  String plateNumber = "";
  String model = "";
  List<String> listDriverPinfl = [];

  void setCarDetails({required CarDetailsModel carDetailsModel}) {
    fio = carDetailsModel.fio;
    pinfl = carDetailsModel.pinfl;
    plateNumber = carDetailsModel.plateNumber;
    model = carDetailsModel.model;
    listDriverPinfl = carDetailsModel.listDriverPinfl;
    notifyListeners();
  }
}
