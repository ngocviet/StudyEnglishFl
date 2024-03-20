import 'package:project4/models/word.dart';

class modelListVocabulary {
  late int totalNumber;
  late int wordsLearned;
  late int wordsBeingStudied;
  late List<Word> listWord;

  modelListVocabulary(
      {required this.totalNumber,
      required this.wordsLearned,
      required this.wordsBeingStudied,
      required this.listWord
      });
}
