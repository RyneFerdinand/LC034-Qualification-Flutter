import 'package:flutter/material.dart';

class GlobalTheme with ChangeNotifier {
  static bool _darkMode = false;

  ThemeMode currTheme() {
    return _darkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
