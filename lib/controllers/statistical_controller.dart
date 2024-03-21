import 'package:project4/model_views/model_statistical.dart';
import 'package:project4/models/word.dart';

class StatisticalController {
  static modelStatistical getData(int id_user){
    return modelStatistical(listWord: 'tree, coffee, apple, fish', totalWord: 30, totalQues: 20, time: '2 tiếng', totalNewWord: 3, totalNewQues: 2, totalOldWord: 4);
  }
}