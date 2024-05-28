import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool isLoading = false;

  void changeToTrue() {
    isLoading = true;
    notifyListeners();
  }

  void changeToFalse() {
    isLoading = false;
    notifyListeners();
  }
}
