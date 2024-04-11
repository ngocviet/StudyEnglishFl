import 'dart:convert';
import 'package:http/http.dart' as http;
class Login{
  static Future<dynamic> getLogin(String UserName, String PassWord) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Login/CheckAcc'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'UserName': UserName,
        "PassWord":PassWord
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}