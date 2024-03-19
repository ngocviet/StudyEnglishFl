import 'package:project4/model_views/model_choose_title.dart';

class ChooseTileController{

    static modelChooseTile getDetail(int id_lesson){
      //from id_lesson => get detail of lesson
      return modelChooseTile(id_lesson: id_lesson, total_word: 1, total_question: 1, total_puzzle: 1);
    }

}