import 'package:project4/models/word.dart';

import '../model_views/model_combine_sentences.dart';

class CombineSentencesController {
 static modelCombineSentences getData() {
  List<Word> listWord = [];
  listWord = [
   Word(nameEn: 'Please', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'Give', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'me', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'coffee', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'and', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
   Word(nameEn: 'milk', wordCount: 0, wordTotalCount: 0, nameVn: '', isShowText: true),
  ];
  return modelCombineSentences(nameVn: 'Vui lòng,cho tôi cà phê và sữa', nameEn: 'Give me coffee and milk,please', listWord: listWord);
 }
}
