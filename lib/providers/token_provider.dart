import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String accessToken = "";
  String refreshToken = "";
  String username = "";

  void setTokens(
      {required String accessToken,
      required String refreshToken,
      required String username}) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
    this.username = username;
    notifyListeners();
  }
}
