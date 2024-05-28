import 'dart:ui';
import 'package:avtoraqam/pages/bottom_nav_bar.dart';
import 'package:avtoraqam/services/clipboard_service.dart';
import 'package:avtoraqam/services/pinfl_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:logger/logger.dart';

import '../models/car_details_model.dart';
import '../providers/riverpod.dart';

class CarDetailsPage extends ConsumerWidget {
  static const String id = "car_details_page";
  CarDetailsModel carDetailsModel;

  CarDetailsPage({required this.carDetailsModel, super.key});

  var logger = Logger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff427D9D),
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ref.watch(loadingProvider).isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "FIO:",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 20,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDDF2FD),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              carDetailsModel.fio,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              // Allows text to wrap into two lines if needed
                              overflow: TextOverflow
                                  .ellipsis, // Adds ellipsis if the text overflows
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PINFL:",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffDDF2FD),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          carDetailsModel.pinfl,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {
                              copyToClipboard(
                                  context: context,
                                  text: carDetailsModel.pinfl);
                            },
                            icon: const Icon(Icons.copy)),
                        IconButton(
                            onPressed: () {
                              PinflDataService.getPinflDetails(
                                  ref, context, carDetailsModel.pinfl);
                            },
                            icon: const Icon(
                              IconlyBold.info_square,
                              color: Colors.green,
                            ))
                      ],
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Avtomashina raqami:".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDDF2FD),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          carDetailsModel.plateNumber,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Model:".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffDDF2FD),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          carDetailsModel.model,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pinfllar:".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffDDF2FD),
                    ),
                    child: Center(
                        child: makeIt(context: context, ref: ref).isNotEmpty
                            ? Column(
                                children: makeIt(context: context, ref: ref),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pinfl mavjud emas",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              )),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }

  List<Widget> makeIt({required BuildContext context, required WidgetRef ref}) {
    List<Widget> lst = [];
    for (int i = 0; i < carDetailsModel.listDriverPinfl.length; i++) {
      lst.add(pinflList(context: context, index: i, ref: ref));
    }
    return lst;
  }

  Widget pinflList(
      {required BuildContext context,
      required int index,
      required WidgetRef ref}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}.",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              carDetailsModel.listDriverPinfl[index],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                copyToClipboard(
                    context: context,
                    text: carDetailsModel.listDriverPinfl[index]);
              },
              icon: const Icon(Icons.copy)),
          IconButton(
              onPressed: () {
                PinflDataService.getPinflDetails(
                    ref, context, carDetailsModel.listDriverPinfl[index]);
              },
              icon: const Icon(
                IconlyBold.info_square,
                color: Colors.green,
              ))
        ],
      ),
    );
  }
}
