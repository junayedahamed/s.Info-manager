import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sinfo/src/home/profile/fetch_profiledata.dart';
import 'package:sinfo/src/informations/user_info.dart';

final FetchProfiledata fechprof = FetchProfiledata();

class InsertFunc extends ChangeNotifier {
  bool conformation = false, _show = true, _show2 = true;
  Future<void> insertRecord(
      String name, String email, String pass, context) async {
    final url = Uri.parse('http://192.168.56.1/practice_api/insert_rec.php');

    try {
      final response = await http.post(url, body: {
        'action': 'insert',
        'name': name,
        'email': email,
        'pass': pass,
      });

      if (response.statusCode == 200) {
        try {
          // Attempt to decode JSON response
          final data = jsonDecode(response.body);

          if (data['status'] == 'success') {
            debugPrint(data['message']);
            var usermail = loginemail;

            fechprof.fetchUserByEmail(context, usermail, 'reg');
            // print("i have data");
            // print(usrinfo);
            conformation = true;
            notifyListeners();
          } else {
            debugPrint("Error: ${data['message']}");
          }
        } catch (e) {
          // Handle cases where the response is not JSON formatted
          debugPrint("Error decoding JSON: $e");
          debugPrint("Response body: ${response.body}");
        }
      } else {
        debugPrint("Server responded with status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Network or server error: $e");
    }
  }

  get show => _show;
  void change() {
    _show = !_show;
    notifyListeners();
  }

  get show2 => _show2;
  void change2() {
    _show2 = !_show2;
    notifyListeners();
  }
}
