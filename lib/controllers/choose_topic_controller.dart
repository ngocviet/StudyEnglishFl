import 'package:project4/models/topic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChooseTopicController{

  static Future<List<dynamic>> getListTopic(String codeUser) async {
    // final response = await http.get(Uri.parse('http://localhost:7183/api/Values?param1=val1'));

    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ChooseTopics/GetListTopic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': codeUser,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> getTopic() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/ChooseTopics/GetTopic'),

    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> getTopicById(int id_topic) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ChooseTopics/GetTopicById'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Id': id_topic,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

}