import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionAnswersAdminController {

  static Future<dynamic> getQuestion(String code) async{
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Question_admin/GetAllqwa'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': code,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }


}