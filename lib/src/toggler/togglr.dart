import 'package:flutter/material.dart';
import 'package:sinfo/src/login/loginpage.dart';

class Togglr extends StatelessWidget {
  const Togglr({super.key});

  @override
  Widget build(BuildContext context) {
    bool val = true;
    if (val) {
      return Loginpage();
    }
  }
}

// class Changepage extends ChangeNotifier {
//   bool _val = true;
//   get val => _val;
//   void change() {
//     _val = !_val;
//     notifyListeners();
//   }
// }
