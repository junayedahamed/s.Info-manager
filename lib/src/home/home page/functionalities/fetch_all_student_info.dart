import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchAllStudentInfo extends ChangeNotifier {
  Future<List<Map<String, dynamic>>> fetchUserTableData(String id) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/fetch_all_student.php'; // Replace with your actual URL

    try {
      // Construct the URL with the `id` query parameter
      final Uri url = Uri.parse("$apiUrl?id=$id");

      // Send the GET request
      final http.Response response = await http.get(url);

      // Log the raw response for debugging
      // debugPrint("Response status: ${response.statusCode}");
      // debugPrint("Response body: ${response.body}");

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        // Decode the JSON response
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success') {
          // Return the fetched data as a list of maps
          return List<Map<String, dynamic>>.from(data['data']);
        } else {
          debugPrint("Error: ${data['message']}");
          throw Exception(data['message']);
        }
      } else {
        // Handle unexpected server responses
        debugPrint("Unexpected response: ${response.body}");
        throw Exception("Failed to fetch data from the table.");
      }
    } catch (e) {
      // Handle errors (e.g., network issues)
      debugPrint("Error fetching user table data: $e");
      throw Exception("Error fetching user table data.");
    }
  }
}
