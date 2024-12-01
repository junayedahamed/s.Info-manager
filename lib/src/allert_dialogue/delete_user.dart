import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class DeleteUser {
  Future<String> deleteUserById(int id) async {
    const String apiUrl = 'http://192.168.56.1/practice_api/delete_recrod.php';

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        body: {'id': id.toString()},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.containsKey("success")) {
          debugPrint("Success: ${data["success"]}");

          return 'success';
        } else if (data.containsKey("error")) {
          debugPrint("Error: ${data["error"]}");
        }
      } else {
        throw Exception(
            "Failed to delete user. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error deleting user: $e");
    }
    return '';
  }
}
