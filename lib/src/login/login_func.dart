import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sinfo/src/home/home%20page/homepage.dart';
import 'package:sinfo/src/home/profile/fetch_profiledata.dart';

class LoginFunc {
  String value = '';
  final FetchProfiledata fetchProfiledata = FetchProfiledata();
  // final Homepage homepage = const Homepage();

  Future<void> login(String email, String pass, context) async {
    final url = Uri.parse('http://192.168.56.1/practice_api/insert_rec.php');
    try {
      final response = await http.post(url, body: {
        'action': 'login',
        'email': email,
        'pass': pass,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          debugPrint("Login successfull");

          fetchProfiledata.fetchUserByEmail(context, email, 'other');
          value = 'success';
          performtastk(value, context);
        } else {
          value = 'failed';
          performtastk(value, context);
        }
      } else {
        debugPrint("some issues aries${response.statusCode}");
      }
    } catch (e) {
      // val = "exception";

      debugPrint("$e");
    }
  }

  void performtastk(var value, context) {
    if (value.toString() == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login successfull"),
          backgroundColor: Colors.green,
          // margin: EdgeInsets.only(
          //   bottom: MediaQuery.of(context).size.height - 150,
          //   left: 15,
          // ),
        ),
      );
      Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ),
      );
    } else if (value.toString() == 'failed') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Wrong email or Password !!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
