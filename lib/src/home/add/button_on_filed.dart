import 'package:flutter/material.dart';

class ButtonOnFiled extends ChangeNotifier {
  String _t1 = "", _t2 = "", _t3 = "", _t4 = "";
  bool _state = false;

  void setone(String newstr) {
    _t1 = newstr;
    check();
    notifyListeners();
  }

  void settwo(String newstr) {
    _t2 = newstr;

    check();
    notifyListeners();
  }

  void sethre(String newstr) {
    _t3 = newstr;

    check();
    notifyListeners();
  }

  void setfour(String newstr) {
    _t4 = newstr;

    check();
    notifyListeners();
  }

  get state => _state;
  void check() {
    if (_t1.isEmpty == true ||
        _t2.isEmpty == true ||
        _t3.isEmpty == true ||
        _t4.isEmpty == true) {
      _state = false;
    } else {
      _state = true;
    }
    notifyListeners();
  }
}
