import 'package:flutter/material.dart';

class AppLocalizationProvider extends ChangeNotifier {
  Locale language = Locale("en");

  void changeLanguage(String code) {
    language = Locale(code);
    notifyListeners();
  }
}
