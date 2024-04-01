import 'dart:convert';

import 'package:http/http.dart' as http;
class learnWordController{
  static Future<dynamic> getDataQuestion(String codeLesson, int stt) async {
    final response = await http.post( Uri.parse('http://localhost:7183/api/LearnWord/getDataQuestion'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': codeLesson,
        'Stt': stt,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}