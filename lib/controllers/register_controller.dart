import 'dart:convert';
import 'package:http/http.dart' as http;
class RegisterController{
  static Future<dynamic> getRegister(String UserName, String PassWord,String Name) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Login/Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "UserName": UserName,
        "PassWord":PassWord,
        "Name":Name,
        "IsAdmin": false,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}