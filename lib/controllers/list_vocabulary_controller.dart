import 'dart:convert';

import '../model_views/model_list_vocabulary.dart';
import '../models/word.dart';
import '../config/localhost.dart';
import 'package:http/http.dart' as http;

class ListVocabularyScreenController {

  static modelListVocabulary getData(bool memorized){
    List<Word> listWord = [];
    if(memorized == true){
      listWord = [
        Word(nameEn: 'Hi', wordCount: 5, wordTotalCount: 5, nameVn: '', isShowText: true),
        Word(nameEn: 'Cat', wordCount: 5, wordTotalCount: 5, nameVn: '', isShowText: true),
        Word(nameEn: 'Fish', wordCount: 5, wordTotalCount: 5, nameVn: '', isShowText: true),
      ];
    }else{
    listWord = [
      Word(nameEn: 'Hello', wordCount: 2, wordTotalCount: 5, nameVn: '', isShowText: true),
      Word(nameEn: 'Goodbye', wordCount: 1, wordTotalCount: 5, nameVn: '', isShowText: true),
      Word(nameEn: 'Apple', wordCount: 4, wordTotalCount: 5, nameVn: '', isShowText: true),
    ];
  }
    return  modelListVocabulary(totalNumber: 40, wordsLearned: 30, wordsBeingStudied: 10, listWord: listWord);
  }
  static Future<List<dynamic>> getDataFromApi() async {
    String local = Localhost.getLocal();
    final response = await http.get(Uri.parse('http://localhost:$local/api/Accounts'));

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

}
