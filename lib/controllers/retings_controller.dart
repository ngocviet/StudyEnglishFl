import 'dart:convert';

import 'package:http/http.dart' as http;

class RetingsController{
  static Future<dynamic> getRetings() async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Ratings/RetingsUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'UserCode': 'viet_1',
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data getListWord');
    }
  }
  static Future<dynamic> getRankLastmonth() async{
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Ratings/RankLastMonth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'UserCode': 'viet_1',
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data getListWord');
    }
  }
}
