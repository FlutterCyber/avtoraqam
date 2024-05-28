import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard({required BuildContext context, required String text}) {
  Clipboard.setData(ClipboardData(text: text)).then(
    (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Color(0xffDDF2FD),
            content: Text(
              'Copied',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            )),
      );
    },
  );
}
