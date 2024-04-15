import 'dart:convert';
import 'package:project4/models/word.dart';

import 'package:http/http.dart' as http;
import '../model_views/model_combine_sentences.dart';

class CombineSentencesController {
 // static modelCombineSentences getData() {
 //  List<Word> listWord = [];
 //  listWord = [
 //   Word(nameVn: 'cà', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'Lisa', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'sữa', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'Xin', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'và', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'Ben', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'nước', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'chào', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'chào', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //   Word(nameVn: 'chào', wordCount: 0, wordTotalCount: 0, nameEn: '', isShowText: true),
 //  ];
 //  return modelCombineSentences(nameVn: '', nameEn: 'Hello, Ben and Lisa!', listWord: listWord);
 // }
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
