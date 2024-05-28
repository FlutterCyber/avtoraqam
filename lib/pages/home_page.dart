import 'package:avtoraqam/pages/widgets/jismoniy_shaxs_widget.dart';
import 'package:avtoraqam/pages/widgets/tab_item_widget.dart';
import 'package:avtoraqam/pages/widgets/yuridik_shaxs_widget.dart';
import 'package:avtoraqam/providers/riverpod.dart';
import 'package:avtoraqam/services/car_data_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class HomePage extends ConsumerWidget {
  static const String id = "home_page";

  HomePage({super.key});

  var logger = Logger();

  /// jismoniy
  TextEditingController jismoniyRegionNumberController =
      TextEditingController();
  TextEditingController jismoniyFirstLetterController = TextEditingController();
  TextEditingController jismoniyNumber1Controller = TextEditingController();
  TextEditingController jismoniyNumber2Controller = TextEditingController();
  TextEditingController jismoniyNumber3Controller = TextEditingController();
  TextEditingController jismoniyLastLettersController = TextEditingController();

  /// yuridik
  TextEditingController yuridikRegionNumberController = TextEditingController();
  TextEditingController yuridikNumber1Controller = TextEditingController();
  TextEditingController yuridikNumber2Controller = TextEditingController();
  TextEditingController yuridikNumber3Controller = TextEditingController();
  TextEditingController yuridikLettersController = TextEditingController();

  void getCarDataJismoniy(
    WidgetRef ref,
    BuildContext context,
    String numberType,
  ) {
    CarDataService carDataService = CarDataService.jismoniy(
      ref: ref,
      context: context,
      numberType: "jismoniy",
      jismoniyRegionNumber: jismoniyRegionNumberController.text.trim(),
      jismoniyFirstLetter: jismoniyFirstLetterController.text.trim(),
      jismoniyNumber1: jismoniyNumber1Controller.text.trim(),
      jismoniyNumber2: jismoniyNumber2Controller.text.trim(),
      jismoniyNumber3: jismoniyNumber3Controller.text.trim(),
      jismoniyLastLetters: jismoniyLastLettersController.text.trim(),
    );
    carDataService.getCarData();
  }

  void getCarDataYuridik(
    WidgetRef ref,
    BuildContext context,
    String numberType,
  ) {
    CarDataService carDataService = CarDataService.yuridik(
      ref: ref,
      context: context,
      numberType: "yuridik",
      yuridikRegionNumber: yuridikRegionNumberController.text.trim(),
      yuridikNumber1: yuridikNumber1Controller.text.trim(),
      yuridikNumber2: yuridikNumber2Controller.text.trim(),
      yuridikNumber3: yuridikNumber3Controller.text.trim(),
      yuridikLastLetters: yuridikLettersController.text.trim(),
    );
    carDataService.getCarData();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        length: 2,
        child: Form(
          child: Scaffold(
              drawer: const Drawer(),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Color(0xff427D9D),
                title: const Text(
                  "Avtoraqam",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PreferredSize(
                        preferredSize: const Size.fromHeight(40),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff9BBEC8),
                            ),
                            child: const TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                color: Color(0xff427D9D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black54,
                              tabs: [
                                TabItem(
                                  title: 'Jismoniy',
                                ),
                                TabItem(
                                  title: 'Yuridik',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 285,
                        child: Center(
                          child: TabBarView(
                            children: [
                              JismoniyShaxsWidget(
                                context: context,
                                ref: ref,
                                regionNumberController:
                                    jismoniyRegionNumberController,
                                firstLetterController:
                                    jismoniyFirstLetterController,
                                number1Controller: jismoniyNumber1Controller,
                                number2Controller: jismoniyNumber2Controller,
                                number3Controller: jismoniyNumber3Controller,
                                lastLettersController:
                                    jismoniyLastLettersController,
                                getCarData: getCarDataJismoniy,
                              ),
                              YuridikShaxsWidget(
                                context: context,
                                ref: ref,
                                yuridikRegionNumberController:
                                    yuridikRegionNumberController,
                                yuridikNumber1Controller:
                                    yuridikNumber1Controller,
                                yuridikNumber2Controller:
                                    yuridikNumber2Controller,
                                yuridikNumber3Controller:
                                    yuridikNumber3Controller,
                                yuridikLettersController:
                                    yuridikLettersController,
                                getCarData: getCarDataYuridik,
                              ),
                              // jismoniyShaxs(context, ref),
                              // yuridikShaxs(context, ref),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                    ],
                  ))),
        ));
  }
}
