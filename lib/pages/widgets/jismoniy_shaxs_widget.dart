import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';

import '../../providers/riverpod.dart';

class JismoniyShaxsWidget extends StatelessWidget {
  final BuildContext context;
  final WidgetRef ref;
  final TextEditingController regionNumberController;
  final TextEditingController firstLetterController;
  final TextEditingController number1Controller;
  final TextEditingController number2Controller;
  final TextEditingController number3Controller;
  final TextEditingController lastLettersController;
  final void Function(WidgetRef, BuildContext, String numberType) getCarData;

  JismoniyShaxsWidget({
    required this.context,
    required this.ref,
    required this.regionNumberController,
    required this.firstLetterController,
    required this.number1Controller,
    required this.number2Controller,
    required this.number3Controller,
    required this.lastLettersController,
    required this.getCarData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3)),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Region number
                _buildTextField(
                  controller: regionNumberController,
                  hintText: "00",
                  maxLength: 2,
                  nextFocus: true,
                  previousFocus: false,
                  currentFocus: FocusScope.of(context),
                ),

                // Divider
                Container(
                  height: 85,
                  width: 3,
                  color: Colors.black,
                ),

                // First letter
                _buildTextField(
                  controller: firstLetterController,
                  hintText: "A",
                  maxLength: 1,
                  nextFocus: true,
                  previousFocus: true,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  currentFocus: FocusScope.of(context),
                ),

                // Number fields
                _buildTextField(
                  controller: number1Controller,
                  hintText: "1",
                  maxLength: 1,
                  nextFocus: true,
                  previousFocus: true,
                  currentFocus: FocusScope.of(context),
                ),
                _buildTextField(
                  controller: number2Controller,
                  hintText: "2",
                  maxLength: 1,
                  nextFocus: true,
                  previousFocus: true,
                  currentFocus: FocusScope.of(context),
                ),
                _buildTextField(
                  controller: number3Controller,
                  hintText: "3",
                  maxLength: 1,
                  nextFocus: true,
                  previousFocus: true,
                  currentFocus: FocusScope.of(context),
                ),

                // Last letters
                _buildTextField(
                  controller: lastLettersController,
                  hintText: "AA",
                  maxLength: 2,
                  nextFocus: false,
                  previousFocus: true,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  currentFocus: FocusScope.of(context),
                ),

                // Flag column
                SizedBox(
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/uzflag.png",
                        width: 30,
                      ),
                      const Text(
                        "UZ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ref.watch(loadingProvider).isLoading
              ? Center(child: const CircularProgressIndicator())
              : SizedBox.shrink(),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xff427D9D),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {
              getCarData(ref, context, 'jismoniy');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(IconlyLight.search, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text(
                  'Qidirish',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required int maxLength,
    required bool nextFocus,
    required bool previousFocus,
    TextInputType textInputType = TextInputType.number,
    TextCapitalization textCapitalization = TextCapitalization.none,
    required FocusScopeNode currentFocus,
  }) {
    return SizedBox(
      width: maxLength == 1 ? 30 : 65,
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 40),
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          keyboardType: textInputType,
          textAlign: TextAlign.center,
          textCapitalization: textCapitalization,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
            if (textInputType == TextInputType.text)
              TextInputFormatter.withFunction((oldValue, newValue) {
                return TextEditingValue(
                  text: newValue.text.toUpperCase(),
                  selection: newValue.selection,
                );
              }),
          ],
          onChanged: (value) {
            if (value.length == maxLength && nextFocus) {
              currentFocus.nextFocus();
            } else if (value.isEmpty && previousFocus) {
              currentFocus.previousFocus();
            }
          },
        ),
      ),
    );
  }
}
