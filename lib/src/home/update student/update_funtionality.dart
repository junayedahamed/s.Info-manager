import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sinfo/src/home/home%20page/homepage.dart';

class UpdateUserService {
  Future<void> updatestudent({
    required context,
    required String userId,
    required String index,
    required String idnumber,
    required String name,
    required String email,
    required String dept,
  }) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/update_student_info.php';

    try {
      // Send POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "user_id": userId,
          "index": index,
          "idnumber": idnumber,
          "name": name,
          "email": email,
          "dept": dept,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          debugPrint("User updated: ${data['message']}");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ),
          );
        } else {
          debugPrint("Error: ${data['message']}");
        }
      } else {
        throw Exception("Failed to update the user.");
      }
    } catch (e) {
      debugPrint("Error updating user: $e");
    }
  }
}
