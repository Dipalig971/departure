import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get themeDark => isDark;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class FavouriteProvider extends ChangeNotifier {
  bool isLike = false;

  bool get fav => isLike;

  void changeIcon() {
    isLike = !isLike;
    notifyListeners();
  }
}