import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sinfo/src/home/profile/profile.dart';

import 'dart:convert';

import 'package:sinfo/src/informations/user_info.dart';
import 'package:sinfo/src/table%20creates/createtable.dart';

Createtable ct = Createtable();

class FetchProfiledata {
  Future<void> fetchUserByEmail(context, String email, String indicator) async {
    const String apiUrl = 'http://192.168.56.1/practice_api/get_user.php';

    if (indicator == '') {
      try {
        if (email.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You are in guest mode"),
              backgroundColor: Colors.deepPurple,
            ),
          );
        } else {
          debugPrint("Fetching user with email: $email");
          final response = await http.get(Uri.parse("$apiUrl?email=$email"));

          if (response.statusCode == 200) {
            final Map<String, dynamic> data = json.decode(response.body);
            if (data.isEmpty) {
              debugPrint("No user found on that name");
            } else {
              usrinfo = data;
              // print("normal ind:");
              // print(usrinfo);
            }
            if (data.containsKey("error")) {
              debugPrint(data["error"]);
            } else {
              showDialog(
                context: context,
                builder: (context) => Profile(),
              );
              debugPrint("Fetched user data: $data");

              // return {
              //   "id": data["id"],
              //   "name": data["name"],
              //   "email": data["email"]
              // };
            }
          } else {
            throw Exception("Failed to load user data");
          }
        }
      } catch (e) {
        // Handle error with snackbar
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error occurred while fetching user data"),
          ),
        );
        debugPrint("Error fetching user data: $e");
        // return {};
      }
    } else if (indicator == 'reg') {
      try {
        if (email.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You are in guest mode"),
              backgroundColor: Colors.deepPurple,
            ),
          );
        } else {
          debugPrint("Fetching user with email: $email");
          final response = await http.get(Uri.parse("$apiUrl?email=$email"));

          if (response.statusCode == 200) {
            final Map<String, dynamic> data = json.decode(response.body);
            if (data.isEmpty) {
              debugPrint("No user found on that name");
            } else {
              usrinfo = data;
              // print("from reg");
              await ct.createUserTable(usrinfo["id"].toString());
              debugPrint("$usrinfo");
            }
            if (data.containsKey("error")) {
              debugPrint(data["error"]);
            } else {
              // showDialog(
              //   // ignore: use_build_context_synchronously
              //   context: context,
              //   builder: (context) => Profile(),
              // );
              debugPrint("Fetched user data: $data");

              // return {
              //   "id": data["id"],
              //   "name": data["name"],
              //   "email": data["email"]
              // };
            }
          } else {
            throw Exception("Failed to load user data");
          }
        }
      } catch (e) {
        // Handle error with snackbar
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error occurred while fetching user data"),
          ),
        );
        debugPrint("Error fetching user data: $e");
        // return {};
      }
    } else {
      try {
        if (email.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You are in guest mode"),
              backgroundColor: Colors.deepPurple,
            ),
          );
        } else {
          debugPrint("Fetching user with email: $email");
          final response = await http.get(Uri.parse("$apiUrl?email=$email"));

          if (response.statusCode == 200) {
            final Map<String, dynamic> data = json.decode(response.body);
            if (data.isEmpty) {
              debugPrint("No user found on that name");
            } else {
              usrinfo = data;
              debugPrint("from others");
              debugPrint("$usrinfo");
            }
            if (data.containsKey("error")) {
              debugPrint(data["error"]);
            } else {
              // showDialog(
              //   // ignore: use_build_context_synchronously
              //   context: context,
              //   builder: (context) => Profile(),
              // );
              debugPrint("Fetched user data: $data");

              // return {
              //   "id": data["id"],
              //   "name": data["name"],
              //   "email": data["email"]
              // };
            }
          } else {
            throw Exception("Failed to load user data");
          }
        }
      } catch (e) {
        // Handle error with snackbar
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error occurred while fetching user data"),
          ),
        );
        debugPrint("Error fetching user data: $e");
        // return {};
      }
    }
  }
}
