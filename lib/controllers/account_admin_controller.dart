import 'dart:convert';

import 'package:http/http.dart' as http;

class AccountController {

  static Future<List<dynamic>> getAccountInfo() async{
    final response = await http.get(
      Uri.parse('http://localhost:7183/api/Accounts'),

    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<dynamic> deleteItem(String code,String type) async{
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/DeleteItem'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Code': code,
        'Type': type,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }

  static Future<List<dynamic>> getAccountId(String code) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/AccountAdmin/GetAccountById'),
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
      throw Exception('Failed to load data getAccountId');
    }
  }


}