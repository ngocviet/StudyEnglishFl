import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/screen/message/success_screen.dart';
import 'package:project4/screen/message/un_success_screen.dart';

import '../controllers/answer_the_question_controller.dart';
import '../models/answer.dart';

class AnswerTheQuestionScreen extends StatefulWidget {
  final String UserCode;
  final String CodeLesson;
  AnswerTheQuestionScreen(
      {super.key, required this.CodeLesson, required this.UserCode});

  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<AnswerTheQuestionScreen> {
  List<dynamic> listAnswer = [];
  List<dynamic> listQuestion = [];
  int stt = 0;
  String question = "";
  String codeQuestion = "";
  String avatar = "question.jpg";
  int showMessage = 0;
  List<dynamic> answer = [];
  String answerCorrect = "";
  int totalHeart = 3;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final dataQuestion = await AnswerTheQuestionController.getDataQuestion(
          widget.CodeLesson, widget.UserCode);
      final dataAnswer = await AnswerTheQuestionController.getDataAnswer(
          widget.CodeLesson, widget.UserCode);
      setState(() {
        listAnswer = dataAnswer;
        answer = listAnswer[stt]["answers"];
        listQuestion = dataQuestion;
        codeQuestion = dataQuestion[stt]["code"];
        question = dataQuestion[stt]["question"];
        avatar = dataQuestion[stt]["avatar"];
        answerCorrect = answer.firstWhere((e) => e["isTrue"])["name"];
      });
    } catch (e) {
      print('Error: screen $e');
    }
  }

  void nextQuestion(bool isCorrect) {
    stt++;
    if (stt < listQuestion.length) {
      setState(() {
        question = listQuestion[stt]['question'];
        avatar = listQuestion[stt]['avatar'];
        answer = listAnswer[stt]["answers"];
        codeQuestion = listQuestion[stt]['code'];
        answerCorrect = answer.firstWhere((e) => e["isTrue"])["name"];
        showMessage = 0;
      });
    } else {
      Navigator.pop(context, 1);
    }
  }

  void checkCorrect(bool status) {
    setState(() {
      showMessage = status ? 1 : 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color.fromRGBO(158, 182, 203, 1.0),
          iconSize: 40,
        ),
        title: Row(
          children: [
            Expanded(
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: 18,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(197, 206, 215, 1.0),
                      borderRadius: BorderRadius.circular(9)),
                ),
                Container(
                  width: 100,
                  height: 18,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 182, 32, 1.0),
                      borderRadius: BorderRadius.circular(9)),
                ),
                Positioned(
                  top: 4,
                  left: 15,
                  child: Container(
                    width: 70,
                    height: 6,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.3),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                ),
              ]),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.red,
                        iconSize: 30,
                      ),
                    ),
                    Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ))
                  ],
                ),
                Text(
                  '$totalHeart',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(2, 33, 47, 1.0),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(2, 33, 47, 1.0),
        ),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Trả lời câu hỏi',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 40),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
                            child: const Icon(
                              Icons.messenger,
                              color: Color.fromRGBO(183, 183, 183, 1.0),
                              size: 26,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 4),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(136, 136, 136, 1.0),
                                        width: 1),
                                  ),
                                ),
                                child: Text(
                                  question,
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  image: AssetImage(avatar),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: answer.length,
                          // reverse: true,
                          itemBuilder: (context, index) {
                            var item = answer[index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(75, 75, 75, 0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    side: BorderSide(
                                        color: !item['isChoose']
                                            ? const Color.fromRGBO(
                                                90, 104, 129, 1.0)
                                            : const Color.fromRGBO(
                                                75, 199, 84, 1.0),
                                        width: 3),
                                  ),
                                  onPressed: () {
                                    // chooseAnswer(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      item['name'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // backgroundColor: !canSubmit
                                //     ? const Color.fromRGBO(94, 94, 94, 1.0)
                                //     : const Color.fromRGBO(67, 203, 47, 1.0),
                                backgroundColor: const Color.fromRGBO(94, 94, 94, 1.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                // if (canSubmit) {
                                //   next();
                                // }

                                Navigator.pop(context, 1);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Kiểm tra',
                                  style: TextStyle(
                                      // color: !canSubmit
                                      //     ? const Color.fromRGBO(134, 134, 134, 1.0)
                                      //     : Colors.black,
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showMessage == 1)
              SuccessScreen(onTap: () {
                nextQuestion(true);
              }),
            if (showMessage == 2)
              UnSuccessScreen(
                  onTap: () {
                    nextQuestion(false);
                  },
                  answer: answerCorrect)
          ],
        ),
      ),
    );
  }
}
