import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mySnackbar(
    {required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xffDDF2FD),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
