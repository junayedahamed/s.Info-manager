import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Createtable {
  Future<void> createUserTable(String userId) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/create_table_for_user.php';

    try {
      // Send a GET request with the user_id as a query parameter
      final response = await http.get(Uri.parse("$apiUrl?user_id=$userId"));

      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success') {
          // Handle success response
          debugPrint("Table created: ${data['message']}");
        } else {
          // Handle error response
          debugPrint("Error: ${data['message']}");
        }
      } else {
        throw Exception("Failed to create table.");
      }
    } catch (e) {
      // Handle errors (network issues, etc.)
      debugPrint("Error creating user table: $e");
    }
  }
}
