import 'dart:convert';

import 'package:http/http.dart' as http;

class ListVocabularyScreenController {


  static Future<List<dynamic>> getListWord(String code, bool isRemomerize) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ListVocabularys/ListWords'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'CodeUser': code,
        'IsRemomerize': isRemomerize,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data getListWord');
    }
  }
  static Future<dynamic> infoTotalWord(String code) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ListVocabularys/InfoTotalWord'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'CodeUser': code,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data infoTotalWord');
    }
  }
}
