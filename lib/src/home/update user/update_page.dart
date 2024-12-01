import 'package:flutter/material.dart';
import 'package:sinfo/src/home/home%20page/homepage.dart';
import 'package:sinfo/src/home/update%20user/update_func.dart';
import 'package:sinfo/src/informations/user_info.dart';

class UpdateUserInformation extends StatelessWidget {
  UpdateUserInformation({super.key});
  final TextEditingController updatedname = TextEditingController();
  final TextEditingController updatedemail = TextEditingController();
  final UpdateFunc update = UpdateFunc();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 550,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter Updated information here",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                controller: updatedname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("new name"),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                controller: updatedemail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("new email"),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton(
              onPressed: () {
                if (updatedemail.text.isEmpty) {
                  updatedemail.text = usrinfo['email'];
                }
                if (updatedname.text.isEmpty) {
                  updatedname.text = usrinfo['name'];
                }
                var id = usrinfo['id'].toString();
                update.updateInformation(
                  updatedname.text,
                  updatedemail.text,
                  id,
                  context,
                );

                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                );
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
