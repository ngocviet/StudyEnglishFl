import 'dart:convert';

import 'package:http/http.dart' as http;
class AnswerTheQuestionController{
  static Future<dynamic> getDataQuestion() async {
    final response = await http.post(Uri.parse('http://localhost:7183/api/AnswerTheQuestion/GetDataQuestion'), );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<List<dynamic>> getDataAnswer() async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/AnswerTheQuestion/GetDataAnswer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'IdUser': 1,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
