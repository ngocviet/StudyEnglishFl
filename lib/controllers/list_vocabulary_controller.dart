import 'dart:convert';

import 'package:http/http.dart' as http;

class ListVocabularyScreenController {


  static Future<List<dynamic>> getListWord() async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ListVocabularys/ListWords'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'IdUser': 1,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<dynamic> totalNumber() async {
    final response = await http.get(Uri.parse('http://localhost:7183/api/ListVocabularys/TotalNumber'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
