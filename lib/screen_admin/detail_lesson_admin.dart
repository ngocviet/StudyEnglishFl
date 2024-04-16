import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/lesson_admin_controller.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/question_answers_admin_controller.dart';

class detailLessonAdmin extends StatefulWidget {
  final String code;
  const detailLessonAdmin({Key? key, required this.code}) : super(key: key);

  @override
  _Lesson1AdminState createState() => _Lesson1AdminState();
}

class _Lesson1AdminState extends State<detailLessonAdmin> {
  bool showQuestions1 = true;
  bool showQuestions2 = false;

  Map<String, bool> showAnswers = {};
  List<dynamic> questions = [];

  Color wordButtonColor = Colors.black;
  Color wordButtonColor1 = Colors.blue;


  List<dynamic> words = [];
  List<dynamic> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final word = await LessonAdminController.GetWord();

      final acc = await AccountController.getAccountId(widget.code);

      final data1 = await QuestionAnswersAdminController.getQuestion();
      setState(() {
        words = word;
        accounts = acc;
        questions = data1;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Title(color: Colors.blue,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text('Lesson Manager',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/abc1.jpg',height: 50,width: 50,fit: BoxFit.cover,)),)
                      ],),

                  ],
                ),
              )
          )
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: wordButtonColor1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), // Chỉnh sửa góc trên bên trái
                            bottomLeft: Radius.circular(10),
                          ),
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        showQuestions1 = true;
                        showQuestions2 = false;
                        wordButtonColor1 = Colors.blue;
                        wordButtonColor = Colors.black;
                      });
                    },
                    child: Container(
                      height: 40,
                      child:
                      const Center(
                        child: Text(
                          'Word',
                          style: TextStyle(
                            color: Colors.white, // Màu chữ của nút
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  wordButtonColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10), // Chỉnh sửa góc trên bên trái
                          bottomRight: Radius.circular(10),
                        ),
                      ),

                    ),
                    onPressed: () {
                      setState(() {
                        showQuestions1 = false;
                        showQuestions2 = true;
                        wordButtonColor1 = Colors.black;
                        wordButtonColor = Colors.blue; // Chuyển về màu mặc định khi nút được nhấn
                      });
                    },
                    child: Container(
                      height: 40,
                      child:
                      const Center(
                        child: Text(
                          'Question',
                          style: TextStyle(
                            color: Colors.white, // Màu chữ của nút
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child:ListView.builder(
                itemCount: showQuestions1 ? words.length : questions.length,
                itemBuilder: (context, index) {
                  var word = showQuestions1 ? words[index] : questions[index];
                  final bool isShowingAnswers = showAnswers[word['questionCode']] ?? false;
                  if(showQuestions1) {
                    return  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(10)
                          )
                      ),
                      onPressed: () {
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              '${word['nameEN']}: ${word['nameVN']} ',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                              softWrap: true,
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      ),

                    );
                  } else{
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width , 70),
                            ),
                            onPressed: () {
                              setState(() {
                                showAnswers[word['questionCode']] = !isShowingAnswers;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${word['questionName']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black, // Màu của biểu tượng
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (isShowingAnswers) ...[

                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: word['answers'].map<Widget>((answer) {
                                return Container(
                                  color: answer['isTrue'] ? Colors.blue : null,
                                  child:
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10), // Độ bo tròn ở đây là 10
                                      ),
                                    ),
                                    onPressed: () {

                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.6,
                                      height: 40,
                                      child: Center(
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${(answer['answerName'])}',style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              ),


                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                        Divider(),
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
