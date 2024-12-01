import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteStudentService {
  Future<bool> deleteStudent(
      {required String userId, required String itemIndex}) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/delete_individual_student.php';

    try {
      // Send the request to the API
      final response = await http.get(
        Uri.parse("$apiUrl?user_id=$userId&item_index=$itemIndex"),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          debugPrint("Student deleted: ${data['message']}");
          return true;
        } else {
          debugPrint("Error: ${data['message']}");
          return false;
        }
      } else {
        throw Exception("Failed to delete the student.");
      }
    } catch (e) {
      debugPrint("Error deleting student: $e");
      return false;
    }
  }
}
