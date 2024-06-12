import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import '../providers/riverpod.dart';
import '../services/pinfl_data_service.dart';

class SearchPinflPage extends ConsumerWidget {
  static const String id = "search_pinfl_page";

  SearchPinflPage({super.key});

  TextEditingController pinflController = TextEditingController();

  void getPinflDetails(WidgetRef ref, BuildContext context) {
    PinflDataService.getPinflDetails(ref, context, pinflController.text.trim());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "PINFL ma'lumotlari",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      "Foydalanuvchi:",
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      ref.watch(tokensProvider).username,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ref.watch(loadingProvider).isLoading
                    ? const SizedBox(
                        height: 60,
                        child: Center(child: CircularProgressIndicator()))
                    : const SizedBox.shrink(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: TextField(
                    controller: pinflController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        IconlyBold.profile,
                        color: Colors.teal,
                      ),
                      hintText: "pinfl",
                      border: InputBorder.none, // Removes the bottom line
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                      onPressed: () {
                        getPinflDetails(ref, context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                      ),
                      child: const Text("Qidirish")),
                ),
              ],
            )));
  }
}
