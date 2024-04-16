import 'dart:convert';

import 'package:http/http.dart' as http;
class ProFileController{
  static Future<dynamic> getUser(String codeUser) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ProFile/ProFile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeUser': codeUser,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  static Future<List<dynamic>> getCups(String codeUser) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetCups'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'code': codeUser,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data getCups');
    }
  }
  static Future<List<dynamic>> getListAvatar(String codeUser) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ProFile/GetListAvatar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'code': codeUser,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data getListAvatar');
    }
  }

  static Future<dynamic> editName(String codeUser,String Name) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ProFile/EditProFileName'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeUser': codeUser,
        'name':Name,
        'password':""
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> editAvatar(String codeUser,String avatar) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ProFile/EditAvatar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeUser': codeUser,
        'avatar': avatar,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> editPass(String codeUser,String pass) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/ProFile/EditProFilePass'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'codeUser': codeUser,
        'name':"",
        'password':pass
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}