import '../model_views/model_list_vocabulary.dart';
import '../models/word.dart';

class ListVocabularyScreenController {

  static modelListVocabulary getData(bool memorized){
    List<Word> listWord = [];
    if(memorized == true){
      listWord = [
        Word(nameEn: 'Hi', wordCount: 5, wordTotalCount: 5),
        Word(nameEn: 'Cat', wordCount: 5, wordTotalCount: 5),
        Word(nameEn: 'Fish', wordCount: 5, wordTotalCount: 5),
      ];
    }else{
    listWord = [
      Word(nameEn: 'Hello', wordCount: 2, wordTotalCount: 5),
      Word(nameEn: 'Goodbye', wordCount: 1, wordTotalCount: 5),
      Word(nameEn: 'Apple', wordCount: 4, wordTotalCount: 5),
    ];
  }
    return  modelListVocabulary(totalNumber: 40, wordsLearned: 30, wordsBeingStudied: 10, listWord: listWord);
  }
}
