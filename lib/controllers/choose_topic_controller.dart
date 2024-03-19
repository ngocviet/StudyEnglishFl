import 'package:project4/models/topic.dart';

class ChooseTopicController{

  static List<Topic> getListTopic(){
    //from id_lesson => get detail of lesson
    return [
      Topic(title: 'Gia đình và công việc', img: 'cartoon.jpg', comboColor: '128-222-182',comple_lesson: 1, total_lesson: 30),
      Topic(title: 'Trường học và bạn bè', img: 'cartoon1.jpg', comboColor: '12-192-182',comple_lesson: 5, total_lesson: 10),
    ];
  }

}