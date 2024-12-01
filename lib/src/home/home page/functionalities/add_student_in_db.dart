import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddStudentInDb {
  Future<void> addUserToTable({
    required String id,
    required String idnumber,
    required String name,
    required String email,
    required String dept,
  }) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/add_student_in_table.php'; // Replace with your actual URL

    try {
      // Construct the URL with the `id` query parameter
      final Uri url = Uri.parse("$apiUrl?id=$id");

      // Create the request body
      final Map<String, String> body = {
        'idnumber': idnumber,
        'name': name,
        'email': email,
        'dept': dept,
      };

      // Make the POST request
      final http.Response response = await http.post(
        url,
        body: body,
      );

      // Log the raw response for debugging
      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        // Decode the JSON response
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success') {
          debugPrint("Success: ${data['message']}");
        } else {
          debugPrint("Error: ${data['message']}");
        }
      } else {
        // Handle unexpected server responses
        debugPrint("Unexpected response: ${response.body}");
        throw Exception("Failed to add user to the table.");
      }
    } catch (e) {
      // Handle errors (e.g., network issues)
      debugPrint("Error adding user to table: $e");
    }
  }
}
