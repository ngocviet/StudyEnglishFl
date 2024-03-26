import 'dart:convert';

import 'package:project4/models/account.dart';
import 'package:project4/models/lesson.dart';
import 'package:http/http.dart' as http;
import 'package:project4/models/test.dart';
import 'package:project4/config/localhost.dart';

class HomeController {
  static int getDay() {
    return 10;
  }

  static List<Lesson> getListLesson(int id_user, int id_topic) {
    //from id_user and id_topic => get listLesson
    return [
      Lesson(
          title: 'Có sẵn cái gì đó some or any',
          img: 'cartoon1.jpg',
          sttLesson: 'Bài học số 40',
          totalStar: 2,
          id: 1),
      Lesson(
          title: 'HI and HELLO',
          img: 'cartoon.jpg',
          sttLesson: 'Bài học số 41',
          totalStar: 3,
          id: 2)
    ];
  }
  static Future<dynamic> getDataTopic(int id_topic) async {
    // final response = await http.get(Uri.parse('http://localhost:7183/api/Values?param1=val1'));

    final response = await http.post(
      Uri.parse('http://localhost:7183/api/Homes/GetSttTopic'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Id': id_topic,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
