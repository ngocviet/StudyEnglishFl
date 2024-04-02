import 'dart:convert';

import 'package:http/http.dart' as http;
class AnswerTheQuestionController{
  static Future<List<dynamic>> getDataQuestion(String codeLesson,bool IsCorrect,String UsetCode) async {
    final response = await http.post(Uri.parse('http://localhost:7183/api/AnswerTheQuestion/GetDataQuestion'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'UserCode': UsetCode,
        'CodeLesson' : codeLesson,
        'IsCorrect':IsCorrect,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<List<dynamic>> getDataAnswer(String codeLesson,bool IsCorrect,String UsetCode) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/AnswerTheQuestion/GetDataAnswer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'UserCode': "1",
        'CodeLesson' : codeLesson,
        'IsCorrect' : IsCorrect,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<void> addHistory(String codeLesson, bool IsCorrect, String UsetCode) async {
    await http.post(
      Uri.parse('http://localhost:7183/api/AnswerTheQuestion/AddHistory'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'UserCode': "1",
        'CodeLesson' : codeLesson,
        'IsCorrect' : IsCorrect,
      }),
    );
  }
}
