import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _themeData =
        _themeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
