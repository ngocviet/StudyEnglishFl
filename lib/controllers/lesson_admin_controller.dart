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

}

