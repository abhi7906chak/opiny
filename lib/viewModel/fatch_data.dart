import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:opiny/models/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class FatchData {
  Future<Map<String, dynamic>?> fatchData() async {
    try {
      final response = await http.get(Uri.parse(apiKey));
      if (response.statusCode == 200) {
        developer.log("Data fetch successful");
        try {
          // Directly decode the JSON and return it as a Map
          final Map<String, dynamic> jsonData = jsonDecode(response.body);
          if (jsonData.containsKey('status') &&
              jsonData['status'] == 'success') {
            return jsonData; // Return the raw JSON data
          } else {
            developer.log(
                "API returned a 200 but status was not 'success' or missing.");
            return null;
          }
        } on FormatException catch (e) {
          developer.log("Invalid JSON format: $e");
          return null;
        } catch (e) {
          developer.log("Error during JSON processing: $e");
          return null;
        }
      } else {
        developer
            .log("API request failed with status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      developer.log("Network or other error: $e");
      return null;
    }
  }
}
