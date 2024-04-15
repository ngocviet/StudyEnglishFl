import 'dart:convert';
import 'package:project4/models/word.dart';

import 'package:http/http.dart' as http;
import '../model_views/model_combine_sentences.dart';

class CombineSentencesController {
 static Future<List<dynamic>> getListCombine(String codeLesson) async {
  final rp = await http.post(
   Uri.parse('http://localhost:7183/api/CombineSentences/GetListCombine'),
   headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
   },
   body: jsonEncode(<String, dynamic>{
    'Code': codeLesson,
   }),
  );

  if (rp.statusCode == 200) {
   return json.decode(rp.body) as List<dynamic>;
  } else {
   throw Exception('Failed to load data');
  }
 }
}
