import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchAllStudentInfo extends ChangeNotifier {
  // List<Map<String, dynamic>> dataval = [];
  Future<List<Map<String, dynamic>>> fetchUserTableData(String id) async {
    const String apiUrl =
        'http://192.168.56.1/practice_api/fetch_all_student.php';

    try {
      final Uri url = Uri.parse("$apiUrl?id=$id");

      final http.Response response = await http.get(url);

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success') {
          // dataval.add(data);
          // // print(dataval);
          return List<Map<String, dynamic>>.from(data['data']);
        } else {
          debugPrint("Error: ${data['message']}");
          throw Exception(data['message']);
        }
      } else {
        debugPrint("Unexpected response: ${response.body}");
        throw Exception("Failed to fetch data from the table.");
      }
    } catch (e) {
      debugPrint("Error fetching user table data: $e");
      throw Exception("Click refresh to load data");
    }
  }
}
