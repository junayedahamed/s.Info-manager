import 'package:flutter/material.dart';
import 'package:sinfo/src/informations/user_info.dart';
import 'package:sinfo/src/login/login_func.dart';
import 'package:sinfo/src/registration%20pages/insert_func.dart';
import 'package:sinfo/src/registration%20pages/registration_page.dart';

class Loginpage extends StatelessWidget {
  final InsertFunc cng = InsertFunc();
  Loginpage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final LoginFunc loginFunc = LoginFunc();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    var mobile = [
      Image.asset(
        "image/pc.avif",
        height: 450,
        fit: BoxFit.fitHeight,
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "User Login",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      SizedBox(
        width: 300,
        child: TextField(
          controller: email,
          decoration: const InputDecoration(
            label: Text("Email"),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ListenableBuilder(
          listenable: cng,
          builder: (context, snapshot) {
            return SizedBox(
              width: 300,
              child: TextField(
                obscureText: cng.show,
                controller: pass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: cng.change,
                    icon: cng.show
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  label: const Text("Password"),
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }),
      const SizedBox(
        height: 30,
      ),
      FilledButton(
        onPressed: () {
          if (email.text.isEmpty || pass.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Fill the all text field and try again!"),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            loginemail = email.text.toString();
            loginFunc.login(
                email.text.toString(), pass.text.toString(), context);

            // loginFunc.performtastk(value, context);
          }
        },
        child: const Text("Login"),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(),
                ),
              );
            },
            child: const Text(
              "Register",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    ];

    var pc = [
      Image.asset(
        "image/pc.avif",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 400,
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "User Login",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      SizedBox(
        width: 300,
        child: TextField(
          controller: email,
          decoration: const InputDecoration(
              label: Text("Email"), border: OutlineInputBorder()),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ListenableBuilder(
          listenable: cng,
          builder: (context, snapshot) {
            return SizedBox(
              width: 300,
              child: TextField(
                obscureText: cng.show,
                controller: pass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: cng.change,
                    icon: cng.show
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          ),
                  ),
                  label: const Text("Password"),
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }),
      const SizedBox(
        height: 30,
      ),

      FilledButton(
        onPressed: () {
          if (email.text.isEmpty || pass.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Fill the all fields and try again!"),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            loginemail = email.text.toString();

            loginFunc.login(
                email.text.toString(), pass.text.toString(), context);

            // loginFunc.performtastk(value, context);
          }
        },
        child: const Text("Login"),
      ),
      // FilledButton(
      //   onPressed: () {
      //     if (email.text.isEmpty || pass.text.isEmpty) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text("Fill the all text field and try again!"),
      //           backgroundColor: Colors.red,
      //         ),
      //       );
      //     } else {
      //       loginemail = email.text.toString();
      //       login(email.text.toString(), pass.text.toString());
      //       debugPrint(value);
      //       loginFunc.performtastk(value, context);
      //     }
      //   },
      //   child: const Text("Login"),
      // ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(),
                ),
              );
            },
            child: const Text(
              "Register",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.blue),
            ),
          ),
        ],
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              children: size > 400 ? pc : mobile,
            ),
          ),
        ),
      ),
    );
  }
}
