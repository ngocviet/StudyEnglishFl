import 'package:project4/models/topic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopicAdmin1{
  static Future<List<dynamic>> getTopic() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/TopicAdmin/GetTopic'),

    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<dynamic> AddTopicAPI(String name,String avatar,String comboColor,) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/TopicAdmin/AddTopic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Name': name,
        'Avatar': avatar,
        'ComboColor': comboColor,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(' 1Failed to load data');
    }
  }

  static Future<List<dynamic>> UpdateTopicAPI(String code,String name,String avatar,String comboColor,String updatedBy,DateTime updatedTime) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/TopicAdmin/UpdateTopic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': code,
        'Name':name,
        'Avatar': avatar,
        'ComboColor': comboColor,
        'UpdatedBy': updatedBy,
        'UpdatedTime': updatedTime.toIso8601String()
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> getTopicById(String code) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/TopicAdmin/GetTopicById'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': code,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception(' 1Failed to load dat getTopicById a');
    }
  }

  static Future<List<dynamic>> deleteTopicById(String code) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/TopicAdmin/DeleteTopicByCode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': code,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception(' Failed to load data');
    }
  }

}