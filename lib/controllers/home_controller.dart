import 'package:project4/models/lesson.dart';

class HomeController {

  static int getDay(){
    return 10;
  }

  static String getTopic(){
    return "Hoa quả";
  }

  static List<Lesson> getListLesson(int id_user, int id_topic){

    //from id_user and id_topic => get listLesson
    return [
      Lesson(title: 'Có sẵn cái gì đó some or any', img: 'cartoon1.jpg', sttLesson: 'Bài học số 40', totalStar: 2, id: 1),
      Lesson(title: 'HI and HELLO', img: 'cartoon.jpg', sttLesson: 'Bài học số 41', totalStar: 3, id: 2)
    ];
  }
}