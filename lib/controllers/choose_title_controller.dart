import 'package:project4/model_views/model_choose_title.dart';

class ChooseTileController{

    static modelChooseTile getDetail(int id_lesson){
      //from id_lesson => get detail of lesson
      return modelChooseTile(id_lesson: id_lesson, total_word: 30, total_question: 12, total_puzzle: 7);
    }

}