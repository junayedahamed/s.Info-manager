import 'package:flutter/material.dart';
import 'package:sinfo/src/home/update%20student/textfields.dart';
import 'package:sinfo/src/home/update%20student/update_funtionality.dart';
import 'package:sinfo/src/informations/user_info.dart';

class UpdateStudentDialogue extends StatelessWidget {
  UpdateStudentDialogue({
    super.key,
    required this.name,
    required this.idnumber,
    required this.email,
    required this.dept,
    required this.index,
  });
  final TextEditingController updatedname = TextEditingController();
  final TextEditingController updatedemail = TextEditingController();
  final TextEditingController updatedid = TextEditingController();
  final TextEditingController updateddept = TextEditingController();
  final UpdateUserService updateUserService = UpdateUserService();
  final String name, index;
  final String idnumber;
  final String email, dept;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Eneter updated information of student",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextFields(
              controller: updatedname,
              label: "Updated name",
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextFields(
              controller: updatedid,
              label: "Updated id num",
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextFields(
              controller: updatedemail,
              label: "Updated email",
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextFields(
              controller: updateddept,
              label: "Updated dept",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    if (updateddept.text.isEmpty) {
                      updateddept.text = dept;
                    }
                    if (updatedemail.text.isEmpty) {
                      updatedemail.text = email;
                    }
                    if (updatedid.text.isEmpty) {
                      updatedid.text = idnumber;
                    }
                    if (updatedname.text.isEmpty) {
                      updatedname.text = name;
                    } else {
                      updateUserService.updateUser(
                        context: context,
                        userId: usrinfo['id'].toString(),
                        index: index,
                        idnumber: updatedid.text,
                        name: updatedname.text,
                        email: updatedemail.text,
                        dept: updateddept.text,
                      );
                    }
                  },
                  child: const Text("Update"),
                ),
                const SizedBox(
                  width: 35,
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  height: 90,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
