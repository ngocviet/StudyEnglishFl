import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/answer_the_question_controller.dart';
import '../models/answer.dart';

class AnswerTheQuestionScreen extends StatefulWidget {
  final String codeLesson;

  const AnswerTheQuestionScreen({super.key, required this.codeLesson});

  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<AnswerTheQuestionScreen> {
  List<dynamic> listAnswer = [];
  List<dynamic> listQuestion =[];
  int stt =0;
  String question = '';
  String avatar = "question.jpg";
  int showSuccessMessage = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final dataQuestion = await AnswerTheQuestionController.getDataQuestion(widget.codeLesson);

      final dataAnswer = await AnswerTheQuestionController.getDataAnswer();
      setState(() {
        listAnswer = dataAnswer;
        listQuestion = dataQuestion;
        avatar = dataQuestion[stt]["avatar"];
        question = dataQuestion[stt]["question"];
      });
    } catch (e) {
      print('Error: screen $e');
    }
  }
  void nextQuestion() {
    stt++;
    if (stt < listQuestion.length) {
      setState(() {
        question = listQuestion[stt]['question'];
        avatar = listQuestion[stt]['avatar'];
      });
    }else{
      print('object');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(75, 75, 75, 1),
              ),
              height: 15,
              width: 250,
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(75, 75, 75, 1),
                shape: BoxShape.circle,
              ),
              height: 40,
              width: 40,
              child: const Center(
                  child: Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(30, 30, 30, 54),
                Colors.black87
              ], // Màu sắc cho gradient
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('giaodien3.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              )),
        ),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
                  child: Text(
                    'Trả lời câu hỏi',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 20,50),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      question,
                                      overflow: TextOverflow.visible,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 0, bottom: 0, right: 20),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  image: AssetImage(avatar), fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      listAnswer.length,
                          (index) {
                        var answer = listAnswer[index];
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      // showSuccessMessage = answer['isTrue'];
                                      if(answer['isTrue'] == true){
                                        showSuccessMessage = 1;
                                      }else{
                                        showSuccessMessage = 2;
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      answer['answer'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  )),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (showSuccessMessage == 1) // Kiểm tra điều kiện để hiển thị container
              Positioned(
                bottom: 0, // Đặt vị trí của container ở phía dưới màn hình
                left: 0,
                right: 0,
                height:
                150, // Chiều cao của container là 1 nửa chiều cao của màn hình
                child: Container(
                  color: const Color.fromRGBO(9, 21, 9, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(19, 243, 19, 1),
                                shape: BoxShape
                                    .circle, // Hình dạng của icon là hình tròn
                              ),
                              child: const Center(
                                child: Icon(Icons.check,
                                    color:
                                    Color.fromRGBO(9, 21, 9, 1)), // Icon hình tích (tick)
                              ),
                            ),
                            const SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            const Text('Tuyệt vời !',
                                style: TextStyle(
                                    color: Color.fromRGBO(19, 243, 19, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)), // Text
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: const Color.fromRGBO(19, 243, 19, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                showSuccessMessage = 0;
                              });
                              nextQuestion();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Tiếp Tục',
                                style: TextStyle(
                                  color: Color.fromRGBO(9, 21, 9, 1),
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            if (showSuccessMessage == 2) // Kiểm tra điều kiện để hiển thị container
              Positioned(
                bottom: 0, // Đặt vị trí của container ở phía dưới màn hình
                left: 0,
                right: 0,
                height:
                230, // Chiều cao của container là 1 nửa chiều cao của màn hình
                child: Container(
                  color: const Color.fromRGBO(9, 21, 9, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(243, 10, 10, 1),
                                shape: BoxShape
                                    .circle, // Hình dạng của icon là hình tròn
                              ),
                              child: const Center(
                                child: Icon(Icons.close,
                                    color:
                                    Color.fromRGBO(9, 21, 9, 1)), // Icon hình tích (tick)
                              ),
                            ),
                            const SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            const Text('Không chính xác!',
                                style: TextStyle(
                                    color: Color.fromRGBO(243, 10, 10, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)), // Text
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            Text('Câu trả lời đúng là:',
                                style: TextStyle(
                                    color: Color.fromRGBO(243, 10, 10, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 20),
                        child: Row(
                          children: listAnswer.where((answer) => answer['isTrue']).map((answer) {
                            return Text(
                              answer['answer'],
                              style: const TextStyle(
                                color: Color.fromRGBO(243, 10, 10, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(243, 10, 10, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )
                              ),
                              onPressed: () {
                                setState(() {
                                  showSuccessMessage =0;
                                });
                                nextQuestion();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Đã hiểu',style: TextStyle(color: Color.fromRGBO(9, 21, 9, 1),fontSize: 24),),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}