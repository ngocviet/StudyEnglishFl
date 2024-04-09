import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionAnswersAdminController {

  static Future<List<dynamic>> getQuestion() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/Question_admin/GetAllqwa'),

    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }


}