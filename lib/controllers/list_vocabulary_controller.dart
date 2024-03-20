import '../model_views/model_list_vocabulary.dart';
import '../models/word.dart';

class ListVocabularyScreenController {

  static modelListVocabulary getData(){
    List<Word> listWord = [
      Word(nameEn: 'Hello'),
      Word(nameEn: 'Goodbye'),
      Word(nameEn: 'Apple', ),
    ];
    return  modelListVocabulary(totalNumber: 40, wordsLearned: 30, wordsBeingStudied: 10, listWord: listWord);
  }
}
