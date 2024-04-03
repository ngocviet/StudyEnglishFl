import 'dart:convert';

import 'package:http/http.dart' as http;
class learnWordController{
  static Future<List<dynamic>> getDataQuestion(String codeLesson) async {
    final response = await http.post( Uri.parse('http://localhost:7183/api/LearnWord/getDataQuestion'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': codeLesson,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}