import 'package:project4/model_views/model_home.dart';
import 'package:project4/models/lesson.dart';

class HomeController {

  static int getDay(){
    return 10;
  }

  static String getTopic(){
    return "Hoa quả";
  }

  static List<modelLesonHom> getListLesson(int id_u, int id_topic){
    Lesson lesson = Lesson(title: 'Cái gì có sẵn - some và any', img: 'cartoon.jpg');

    List<modelLesonHom> listItem = [
      modelLesonHom(sttLesson: 'Bài học số 40', totalStar: 3, lesson: lesson),
      modelLesonHom(sttLesson: 'Bài học số 41', totalStar: 3, lesson: Lesson(title: 'HI and HELLO', img: 'cartoon1.jpg'))
    ];

    return listItem;
  }
}