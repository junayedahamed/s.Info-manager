import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sinfo/src/home/profile/fetch_profiledata.dart';
import 'package:sinfo/src/informations/user_info.dart';

final FetchProfiledata fetch = FetchProfiledata();

class UpdateFunc {
  Future<void> updateInformation(
      String newName, String newMail, String id, context) async {
    final Uri url =
        Uri.parse('http://192.168.56.1/practice_api/updateuser.php');

    try {
      // Create the payload
      final Map<String, String> payload = {
        'id': id,
        'name': newName,
        'email': newMail,
      };

      // Make the POST request
      final http.Response response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // Set JSON headers
        body: json.encode(payload), // Encode the payload as JSON
      );

      // Check the response status
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('success')) {
          fetch.fetchUserByEmail(context, newMail, 'others');
          loginemail = newMail;
          debugPrint('Update successful: ${responseData['success']}');
        } else if (responseData.containsKey('error')) {
          debugPrint('Error: ${responseData['error']}');
        } else {
          debugPrint('Unexpected response: ${response.body}');
        }
      } else {
        debugPrint('Failed to update. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error updating information: $e');
    }
  }
}
