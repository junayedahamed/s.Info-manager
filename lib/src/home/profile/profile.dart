import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinfo/src/allert_dialogue/allert_dialogue.dart';
import 'package:sinfo/src/home/update%20user/update_page.dart';
import 'package:sinfo/src/informations/user_info.dart';
import 'package:sinfo/src/login/loginpage.dart';
import 'package:sinfo/src/theme/theme.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  static final MyTheme _myTheme = MyTheme.instance;
  // final DeleteusrById del = DeleteusrById();
  final info = [];
  void take() {
    info.addAll(usrinfo.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Change theme: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListenableBuilder(
                    listenable: _myTheme,
                    builder: (context, snapshot) {
                      return DropdownMenu(
                        onSelected: (value) {
                          _myTheme.changetheme(value);
                        },
                        hintText: "Theme",
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                            value: ThemeMode.light,
                            label: "Light",
                          ),
                          DropdownMenuEntry(
                            value: ThemeMode.dark,
                            label: "Dark",
                          ),
                          DropdownMenuEntry(
                            value: ThemeMode.system,
                            label: "System",
                          ),
                        ],
                      );
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.account_circle_sharp,
              size: 50,
              color: Colors.black,
            ),
            Center(
              child: usrinfo.isEmpty
                  ? const Text(
                      "Name",
                      style: TextStyle(fontSize: 25),
                    )
                  : Text(
                      usrinfo['name'].toString().toUpperCase(),
                      style: const TextStyle(fontSize: 25),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 5,
                ),
                usrinfo.isEmpty
                    ? const Text(
                        "Email:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Row(
                        children: [
                          const Text(
                            "Email: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            usrinfo['email'].toString().toLowerCase(),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                usrinfo.isEmpty
                    ? const Text(
                        "Id:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "Id: ${usrinfo['id']}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Update Info: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => UpdateUserInformation(),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.pen,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AllertDialogue(),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Text(
                        "Delete account",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    usrinfo.clear();
                    loginemail = '';
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Loginpage(),
                      ),
                    );
                  },
                  child: const Text("Logout"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
