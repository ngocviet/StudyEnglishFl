import 'dart:convert';

import 'package:project4/model_views/model_statistical.dart';
import 'package:project4/models/word.dart';
import 'package:http/http.dart' as http;

class StatisticalController {

  static Future<dynamic> getInfoData(String codeUser) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Statistical/GetInfoData'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': codeUser,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}