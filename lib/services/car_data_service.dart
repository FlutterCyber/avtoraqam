import 'package:avtoraqam/pages/widgets/my_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../models/car_details_model.dart';
import '../models/car_number_model.dart';
import '../pages/car_details_page.dart';
import '../providers/riverpod.dart';
import 'network_service.dart';

class CarDataService {
  String jismoniyRegionNumber = "";
  String jismoniyFirstLetter = "";
  String jismoniyNumber1 = "";
  String jismoniyNumber2 = "";
  String jismoniyNumber3 = "";
  String jismoniyLastLetters = "";

  ///
  String yuridikRegionNumber = "";
  String yuridikNumber1 = "";
  String yuridikNumber2 = "";
  String yuridikNumber3 = "";
  String yuridikLastLetters = "";

  ///
  WidgetRef ref;
  BuildContext context;
  String numberType = "";

  var logger = Logger();

  CarDataService.jismoniy({
    required this.ref,
    required this.context,
    required this.numberType,
    required this.jismoniyRegionNumber,
    required this.jismoniyFirstLetter,
    required this.jismoniyNumber1,
    required this.jismoniyNumber2,
    required this.jismoniyNumber3,
    required this.jismoniyLastLetters,
  });

  CarDataService.yuridik({
    required this.ref,
    required this.context,
    required this.numberType,
    required this.yuridikRegionNumber,
    required this.yuridikNumber1,
    required this.yuridikNumber2,
    required this.yuridikNumber3,
    required this.yuridikLastLetters,
  });

  String getNumberJismoniy() {
    String gatheredCarNumber = jismoniyRegionNumber +
        jismoniyFirstLetter +
        jismoniyNumber1 +
        jismoniyNumber2 +
        jismoniyNumber3 +
        jismoniyLastLetters;
    logger.e(gatheredCarNumber);
    return gatheredCarNumber;
  }

  String getNumberYuridik() {
    String gatheredCarNumber = yuridikRegionNumber +
        yuridikNumber1 +
        yuridikNumber2 +
        yuridikNumber3 +
        yuridikLastLetters;
    logger.e(gatheredCarNumber);
    return gatheredCarNumber;
  }

  Future<int?> sendText() async {
    String number = "";
    if (numberType == "jismoniy") {
      number = getNumberJismoniy();
    } else if (numberType == "yuridik") {
      number = getNumberYuridik();
    }
    if (number.isNotEmpty) {
      NetworkService.accessToken = ref.read(tokensProvider).accessToken;
      CarNumberModel carNumberModel = CarNumberModel(car: number);

      Map<String, dynamic>? response = await NetworkService.GET(
          NetworkService.API_SEND_TEXT, carNumberModel.toJson());
      return response!["statusCode"];
    }
    return null;
  }

  void getCarData() async {
    //ref.read(...) circular progress indicatorni yoqish uchun kk
    ref.read(loadingProvider).changeToTrue();
    String number = "";
    if (numberType == "jismoniy") {
      number = getNumberJismoniy();
    } else if (numberType == "yuridik") {
      number = getNumberYuridik();
    }
    NetworkService.accessToken = ref.read(tokensProvider).accessToken;
    CarNumberModel carNumberModel = CarNumberModel(car: number);
    int? statusCode = await sendText();

    if (statusCode == 200 || statusCode == 201) {
      Map<String, dynamic>? response = await NetworkService.GET(
          NetworkService.API_GET_CAR_DATA, carNumberModel.toJson());

      if (response?["statusCode"] == 200 || response?["statusCode"] == 201) {
        logger.e(response?["responseBody"]);
        List lst = response?["responseBody"];
        if (response?["responseBody"][0]["fio"] != null) {

          CarDetailsModel carDetailsModel = CarDetailsModel.fromJson(lst.first);
          //ref.read(...) circular progress indicatorni yoqish uchun kk
          ref.read(loadingProvider).changeToFalse();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  CarDetailsPage(carDetailsModel: carDetailsModel),
            ),
          );
        } else {
          logger.e("RAQAM XATO");
          //ref.read(...) circular progress indicatorni yoqish uchun kk
          ref.read(loadingProvider).changeToFalse();
          mySnackbar(context: context, message: "Raqam xato kiritildi");
        }
      } else if (response == null) {
        ref.read(loadingProvider).changeToFalse();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xffDDF2FD),
            content: Text(
              'Server error',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
