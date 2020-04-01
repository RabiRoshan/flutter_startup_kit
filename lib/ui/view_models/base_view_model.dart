import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
