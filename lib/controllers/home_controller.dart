import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController {

  static Future<List<dynamic>> getListLesson(String codeUser, String codeTopic) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetListLesson'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'CodeUser': codeUser,
        'CodeTopic': codeTopic,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> getDataTopic(String codeTopic) async {
    // final response = await http.get(Uri.parse('http://localhost:7183/api/Values?param1=val1'));

    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetSttTopic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': codeTopic,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> getDay(String codeUser) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetDay'),
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
