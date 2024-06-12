import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/riverpod.dart';

class BoshqaShaxsWidget extends StatelessWidget {
  final BuildContext context;
  final WidgetRef ref;
  final TextEditingController numberController;

  final void Function(WidgetRef ref, BuildContext, String) getCarData;

  const BoshqaShaxsWidget({
    super.key,
    required this.context,
    required this.ref,
    required this.numberController,
    required this.getCarData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 85,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Center(
            child: TextField(
              controller: numberController,
              textCapitalization: TextCapitalization.none,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              decoration: const InputDecoration(
                hintText: "01 H 1 2 3 4 5 6",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ref.watch(loadingProvider).isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink(),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color(0xff427D9D),
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {
              getCarData(ref, context, 'yuridik');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.white, size: 30),
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
    return Center(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
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
          if (value.isEmpty && previousFocus) {
            currentFocus.previousFocus();
          } else if (value.length == maxLength && nextFocus) {
            currentFocus.nextFocus();
          }
        },
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
