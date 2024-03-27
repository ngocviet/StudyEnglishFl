import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController {

  static Future<List<dynamic>> getListLesson(int idUser, int idTopic) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetListLesson'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'IdUser': idUser,
        'IdTopic': idTopic,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> getDataTopic(int id_topic) async {
    // final response = await http.get(Uri.parse('http://localhost:7183/api/Values?param1=val1'));

    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetSttTopic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Id': id_topic,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> getDay(int idUser) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetDay'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Id': idUser,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

}
