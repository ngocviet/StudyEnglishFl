import 'dart:convert';
import 'package:http/http.dart' as http;

class LessonAdminController{
  static Future<List<dynamic>> GetWord() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/LessonAdmin/GetWord'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> listLesson() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/LessonAdmin/ListLesson'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> listTopic() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/LessonAdmin/ListTopic'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<dynamic> addLesson(String codeTopic,String name, String avatar, String description) async{
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/LessonAdmin/addLesson'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeTopic': codeTopic,
        'name': name,
        'avatar':avatar,
        'description':description
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
}

