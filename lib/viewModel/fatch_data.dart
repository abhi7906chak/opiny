import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opiny/models/api/api_key.dart';
import 'package:opiny/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class FatchData {
  Future<Model?>? fatchData() async {
    // return null;
    try {
      final response = await http.get(Uri.parse(apiKey));
       if (response.statusCode == 200) {
        developer.log("Data fatch succesfull");
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'success') {
          return Model.fromJson(jsonData);
        }
        // return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        const Text("Failed to Load\n Check your Internet or try after some time");
        return null;
      }
    } catch (e) {
      developer.log(e.toString());
      return null;
    }
    return null;
  }
}
