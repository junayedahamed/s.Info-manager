import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Deletetable {
  Future<void> deleteUserTable(String userId) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/del_table.php'; // Fixed typo

    try {
      // Print the URL being called
      debugPrint("Calling API: $apiUrl?id=$userId");

      // Send a GET request with the user_id as a query parameter
      final response = await http.get(Uri.parse("$apiUrl?id=$userId"));

      // Log the raw response
      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        // Decode the response body
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success') {
          // Handle success response
          debugPrint("Table deleted: ${data['message']}");
        } else {
          // Handle error response
          debugPrint("Error: ${data['message']}");
        }
      } else {
        // Handle unexpected server responses
        debugPrint("Invalid or empty response from server.");
        throw Exception("Failed to delete the table.");
      }
    } catch (e) {
      // Handle errors (network issues, etc.)
      debugPrint("Error deleting user table: $e");
    }
  }
}
