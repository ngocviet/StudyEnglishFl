import '../models/word.dart';

class ListVocabularyScreenController {
  List<Word> getDummyData() {
    return [
      Word(nameEn: 'Coffee'),
      Word(nameEn: 'Book'),
      Word(nameEn: 'Tree'),
    ];
  }
}
