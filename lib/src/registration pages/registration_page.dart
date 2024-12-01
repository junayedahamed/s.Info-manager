import 'package:flutter/material.dart';
import 'package:sinfo/src/home/home%20page/homepage.dart';
import 'package:sinfo/src/informations/user_info.dart';
import 'package:sinfo/src/login/loginpage.dart';
import 'package:sinfo/src/registration%20pages/blender.dart';
import 'package:sinfo/src/registration%20pages/insert_func.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController id = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController confpassword = TextEditingController();
  final InsertFunc insert = InsertFunc();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    List<Widget> mob = [
      Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Image.asset(
          "image/pc.avif",
          height: 280,
          fit: BoxFit.fitHeight,
          colorBlendMode: BlendMode.multiply,
        ),
        const SizedBox(
          height: 20,
        ),
        BlendMask(
          blendMode: BlendMode.difference,
          child: Center(
            child: Image.asset(
              "image/gif.webp",
              height: 100,
              width: 100,
            ),
          ),
        )
      ]),
      const SizedBox(
        height: 15,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Join with us",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 300,
        child: TextFormField(
          controller: name,
          decoration: const InputDecoration(
            label: Text("Name"),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 300,
        child: TextFormField(
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
          listenable: insert,
          builder: (context, snapshot) {
            return SizedBox(
              width: 300,
              child: TextFormField(
                controller: password,
                obscureText: insert.show,
                decoration: InputDecoration(
                  label: const Text("password"),
                  suffixIcon: IconButton(
                    onPressed: insert.change,
                    icon: insert.show
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }),
      const SizedBox(
        height: 20,
      ),
      ListenableBuilder(
          listenable: insert,
          builder: (context, snapshot) {
            return SizedBox(
              width: 300,
              child: TextFormField(
                controller: confpassword,
                obscureText: insert.show2,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: insert.change2,
                    icon: insert.show2
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  label: const Text("confirm password"),
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }),
      const SizedBox(
        height: 30,
      ),
      FilledButton(
        style: const ButtonStyle(
            enableFeedback: false, animationDuration: Duration(seconds: 2)),
        onPressed: () {
          if (name.text.isEmpty ||
              email.text.isEmpty ||
              password.text.isEmpty ||
              confpassword.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Fill all the field  ',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (confpassword.text != password.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Password and Confirm Password are not same!! ',
                ),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            insert.insertRecord(name.text, email.text, password.text, context);
            loginemail = email.text.toString();

            name.clear();
            email.clear();
            password.clear();
            confpassword.clear();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ),
            );
            name.clear();
            email.clear();
            password.clear();
            confpassword.clear();
          }
        },
        child: const Text("Register"),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Loginpage(),
                  ),
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    ];

    List<Widget> pc = [
      Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Image.asset(
          "image/pc.avif",
          width: double.infinity,
          height: 308,
          fit: BoxFit.fitWidth,
          colorBlendMode: BlendMode.multiply,
        ),
        const SizedBox(
          height: 20,
        ),
        BlendMask(
          blendMode: BlendMode.difference,
          child: Center(
            child: Image.asset(
              "image/gif.webp",
              height: 100,
            ),
          ),
        )
      ]),
      const SizedBox(
        height: 15,
      ),
      const Text(
        "Join with us",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
      SizedBox(
        width: 300,
        child: TextFormField(
          controller: name,
          decoration: const InputDecoration(
            label: Text("Name"),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      SizedBox(
        width: 300,
        child: TextFormField(
          controller: email,
          decoration: const InputDecoration(
            label: Text("Email"),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      ListenableBuilder(
          listenable: insert,
          builder: (context, snapshot) {
            return SizedBox(
              width: 300,
              child: TextFormField(
                controller: password,
                obscureText: insert.show,
                decoration: InputDecoration(
                  label: const Text("password"),
                  suffixIcon: IconButton(
                    onPressed: insert.change,
                    icon: insert.show
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }),
      const SizedBox(
        height: 15,
      ),
      ListenableBuilder(
          listenable: insert,
          builder: (context, snapshot) {
            return SizedBox(
              width: 300,
              child: TextFormField(
                controller: confpassword,
                obscureText: insert.show2,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: insert.change2,
                    icon: insert.show2
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  label: const Text("confirm password"),
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }),
      const SizedBox(
        height: 25,
      ),
      FilledButton(
        style: const ButtonStyle(
            enableFeedback: false, animationDuration: Duration(seconds: 2)),
        onPressed: () {
          if (name.text.isEmpty ||
              email.text.isEmpty ||
              password.text.isEmpty ||
              confpassword.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Fill all the field  ',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (confpassword.text != password.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Password and Confirm Password are not same!! ',
                ),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            insert.insertRecord(name.text, email.text, password.text, context);
            loginemail = email.text.toString();
            name.clear();
            email.clear();
            password.clear();
            confpassword.clear();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ),
            );
          }
        },
        child: const Text("Register"),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Loginpage(),
                  ),
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    ];
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: size > 680 ? pc : mob,
          ),
        ),
      ),
    );
  }
}
