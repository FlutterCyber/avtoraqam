import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String accessToken = "";
  String refreshToken = "";

  void setTokens({required String accessToken, required String refreshToken}) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    notifyListeners();
  }
}
