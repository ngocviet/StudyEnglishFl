import 'package:project4/model_views/model_choose_title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChooseTileController{

    static modelChooseTile getDetail(int id_lesson){
      //from id_lesson => get detail of lesson
      return modelChooseTile(id_lesson: id_lesson, total_word: 30, total_question: 12, total_puzzle: 7);
    }

    static Future<dynamic> getDataFromApi(int idLesson) async {
      final rp = await http.post(
        Uri.parse('http://localhost:7183/api/ChooseTitles/GetData'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'Id': idLesson,
        }),
      );

      if (rp.statusCode == 200) {
        return json.decode(rp.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

}