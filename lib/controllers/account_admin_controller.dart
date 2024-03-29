import 'dart:convert';

import '../models/account.dart';
import 'package:http/http.dart' as http;

class AccountController {

  // static Account getAccountId(int id_account){
  //   return Account(
  //     ID: id_account,
  //     UserName: '1',
  //     PassWord: 'c4ca4238a0b923820dcc509a6f75849b',
  //     Name: 'Name',
  //     Avata: 'abc1.jpg',
  //     CreateBy: 'system',
  //     UpdateBy: 'system',
  //     DeleteBy: '',
  //     CreateTime: DateTime.now(),
  //     UpdateTime: DateTime.now(),
  //     DeleteTime: DateTime.now(),
  //     IsDeleted: false,
  //   );
  // }


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

  static Future<List<dynamic>> getAccountId(int id_user) async {
    final response = await http.post(
      Uri.parse('http://localhost:7183/api/AccountAdmin/GetAccountById'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Id': id_user,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }


}