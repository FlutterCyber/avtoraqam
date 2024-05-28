import 'package:avtoraqam/pages/widgets/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../models/pinfl_details_model.dart';
import '../models/pinfl_model.dart';
import '../pages/pinfl_details_page.dart';
import '../providers/riverpod.dart';
import 'network_service.dart';

class PinflDataService {
  static var logger = Logger();

  static Future<int?> sendPinfl(WidgetRef ref, String pinfl) async {
    if (pinfl.isNotEmpty) {
      NetworkService.accessToken = ref.read(tokensProvider).accessToken;
      PinflModel pinflModel = PinflModel(pinfl: pinfl);

      int? responseStatusCode = await NetworkService.GETSENDPINF(
          NetworkService.API_SEND_PINFL, pinflModel.toJson());
      logger.i("Send pinfl statuc code: $responseStatusCode");
      return responseStatusCode;
    }
    return null;
  }

  static Future<void> getPinflDetails(
      WidgetRef ref, BuildContext context, String pinfl) async {
    if (pinfl.isNotEmpty) {
      //ref.read(...) circular progress indicatorni yoqish uchun kk
      ref.read(loadingProvider).changeToTrue();
      NetworkService.accessToken = ref.read(tokensProvider).accessToken;
      PinflModel pinflModel = PinflModel(pinfl: pinfl);
      int? statusCode = await sendPinfl(ref, pinfl);
      if (statusCode == 200 || statusCode == 201) {
        Map<String, dynamic>? response = await NetworkService.GET(
            NetworkService.API_GET_PINFL, pinflModel.toJson());
        if (response?["statusCode"] == 200 || response?["statusCode"] == 201) {
          logger.e(response?["responseBody"]);
          PinflDetailsModel pinflDetailsModel =
              PinflDetailsModel.fromJson(response?["responseBody"]);
          ref
              .read(pinflDetailsProvider)
              .setPinflDetails(pinflDetailsModel: pinflDetailsModel);

          /// tekshirish kk
          logger.i(
              "***** ${pinflDetailsModel!.fio}\n${pinflDetailsModel!.pinfl}\n${pinflDetailsModel!.phoneNumber} ");

          //ref.read(...) circular progress indicatorni o'chirish uchun kk
          ref.read(loadingProvider).changeToFalse();

          Navigator.pushNamed(context, PinflDetailsPage.id);
        } else if (response == null) {
          //ref.read(...) circular progress indicatorni o'chirish uchun kk
          ref.read(loadingProvider).changeToFalse();
          mySnackbar(context: context, message: "Serverda xatolik");
        }
        //ref.read(...) circular progress indicatorni o'chirish uchun kk
        ref.read(loadingProvider).changeToFalse();
      } else {
        mySnackbar(context: context, message: "Serverda xatolik");
      }
    }else{
      mySnackbar(context: context, message: "Iltimos PINFL kiriting");


    }
  }
}
