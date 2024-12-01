import 'package:flutter/material.dart';
import 'package:sinfo/src/allert_dialogue/delete_user.dart';

import 'package:sinfo/src/informations/user_info.dart';
import 'package:sinfo/src/login/loginpage.dart';
import 'package:sinfo/src/table%20creates/deletetable.dart';
import 'package:sinfo/src/theme/theme.dart';

class AllertDialogue extends StatelessWidget {
  AllertDialogue({super.key});
  static final MyTheme _myTheme = MyTheme.instance;
  final Deletetable deletetable = Deletetable();
  final DeleteUser delusr = DeleteUser();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _myTheme.theme == ThemeMode.dark ||
              _myTheme.theme == ThemeMode.system &&
                  _myTheme.theme == ThemeMode.dark
          ? Colors.black
          : Colors.white,
      title: const Text("Are you sure to delete your account?"),
      content: _myTheme.theme == ThemeMode.light
          ? Image.asset("image/allert.png")
          : Image.asset("image/allertbl.png"),
      actions: [
        TextButton(
          onPressed: () {
            var outp = delusr.deleteUserById(usrinfo['id']);
            var res = deletetable.deleteUserTable(usrinfo['id'].toString());
            if (outp.toString() == "success") {
              debugPrint("$res");
              usrinfo.clear();
              loginemail = '';
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Loginpage(),
              ),
            );
          },
          child: const Text("Ok"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
