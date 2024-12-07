import 'package:flutter/material.dart';
import 'package:sinfo/src/home/add/button_on_filed.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController dept = TextEditingController();
  final TextEditingController email = TextEditingController();
  final ButtonOnFiled buttonOnFiled = ButtonOnFiled();

  // static final Db db = Db();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 350,
        width: 400,
        child: ListenableBuilder(
            listenable: buttonOnFiled,
            builder: (context, snapshot) {
              return Column(
                children: [
                  const Text(
                    "Enter Student Info here!!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 300,
                      child: TextField(
                        onChanged: (value) => buttonOnFiled.setone(value),
                        controller: name,
                        decoration: const InputDecoration(
                          label: Text("Name"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 300,
                      child: TextField(
                        controller: id,
                        onChanged: (value) => buttonOnFiled.settwo(value),
                        decoration: const InputDecoration(
                          label: Text("Student id"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 300,
                      child: TextField(
                        controller: email,
                        onChanged: (value) => buttonOnFiled.setfour(value),
                        decoration: const InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: dept,
                      onChanged: (value) => buttonOnFiled.sethre(value),
                      decoration: const InputDecoration(
                        label: Text("Dept"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                          style: const ButtonStyle(
                            animationDuration: Duration(milliseconds: 300),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel")),
                      buttonOnFiled.state
                          ? FilledButton(
                              onPressed: () {
                                // List student = [];
                                // db.add();
                                Navigator.of(context).pop({
                                  "name": name.text,
                                  'id': id.text,
                                  "dept": dept.text,
                                  "email": email.text,
                                });
                              },
                              child: const Text("Add"),
                            )
                          : const CircularProgressIndicator(
                              strokeAlign:
                                  CircularProgressIndicator.strokeAlignInside,
                              color: Colors.blueAccent,
                            ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
