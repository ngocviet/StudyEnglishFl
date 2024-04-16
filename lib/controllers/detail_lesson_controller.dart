import 'dart:convert';

import 'package:http/http.dart' as http;
class DetailLessonController{
  static Future<dynamic> getDetailLesson(String lessonCode) async {
    final response = await http.post( Uri.parse('http://localhost:7183/api/DetailLesson/GetDetailLesson'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'LessonCode': "L_GD_1",
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<List<dynamic>> listWord(String codeLesson) async{
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/LessonAdmin/ListWord'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeLesson': codeLesson,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
  static Future<dynamic> addWord(String codeLesson,String avatar,String nameEn,nameVn,count) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/WordAdmin/addWord'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeLesson':codeLesson,
        'nameVn':nameVn,
        'nameEn':nameEn,
        'avatar': avatar,
        'count': count,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(' 1Failed to load data');
    }
  }
}