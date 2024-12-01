import 'package:flutter/material.dart';
import 'package:sinfo/src/home/details%20page/display_ev_details.dart';
import 'package:sinfo/src/home/update%20student/update_student_dialogue.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    super.key,
    required this.name,
    required this.email,
    required this.idnumber,
    required this.dept,
    required this.id,
  });
  final String id;
  final String name;
  final String email;
  final String idnumber;
  final String dept;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: true,
        title: const Text("Details page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Detailsrow(prefix: "Name", value: name),
          Detailsrow(prefix: "Email", value: email),
          Detailsrow(prefix: "ID", value: idnumber),
          Detailsrow(prefix: "Dept", value: dept),
          const SizedBox(
            height: 40,
          ),
          FilledButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => UpdateStudentDialogue(
                  index: id,
                  name: name,
                  idnumber: idnumber,
                  email: email,
                  dept: dept,
                ),
              );
            },
            child: const Text("Update Student Info"),
          ),
        ],
      ),
    );
  }
}
