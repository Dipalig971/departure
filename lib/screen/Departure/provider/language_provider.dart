import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String select = "hindi";

  void changeLanguage(String value) {
    select = value;
    notifyListeners();
  }
}