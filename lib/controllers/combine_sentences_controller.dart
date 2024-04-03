import 'package:project4/models/word.dart';

import '../model_views/model_combine_sentences.dart';

class CombineSentencesController {
 static modelCombineSentences getData() {
  List<Word> listWord = [];
  listWord = [
   Word(nameEn: 'cà', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Lisa', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'sữa', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Xin', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'và', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Ben', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'nước', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'chào', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
  ];
  return modelCombineSentences(nameVn: 'Vui lòng, cho tôi cà phê và sữa', nameEn: 'Hello, Ben and Lisa!', listWord: listWord);
 }
 static modelCombineSentences getData1() {
  List<Word> listWord = [];
  listWord = [
   Word(nameEn: 'cà', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Lisa', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Xin', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'và', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Ben', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'nước', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'chào', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
  ];
  return modelCombineSentences(nameVn: 'Vui lòng, cho tôi cà phê và sữa', nameEn: 'Hello, Ben and Lisa!', listWord: listWord);
 }
}
