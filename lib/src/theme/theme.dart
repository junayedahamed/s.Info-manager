import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier {
  MyTheme._();
  static MyTheme instance = MyTheme._();
  ThemeMode _themeData = ThemeMode.light;

  get theme => _themeData;

  changetheme(value) {
    _themeData = value;
    notifyListeners();
  }
}
