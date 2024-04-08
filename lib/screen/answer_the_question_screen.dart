import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/screen/message/game_over_screen.dart';
import 'package:project4/screen/message/message_next_title_screen.dart';
import 'package:project4/screen/message/message_out_screen.dart';
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
  List<dynamic> answer = [];

  String answerCorrect = "";
  int showMessage = 0;
  int totalHeart = 0;
  bool canSubmit = false;
  double percentWidth = 0.0;

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
        stt = 0;
        listAnswer = dataAnswer;
        answer = listAnswer[stt]["answers"];
        listQuestion = dataQuestion;
        codeQuestion = dataQuestion[stt]["code"];
        question = dataQuestion[stt]["question"];
        avatar = dataQuestion[stt]["avatar"];
        answerCorrect = answer.firstWhere((e) => e["isTrue"])["name"];

        showMessage = 0;
        totalHeart = 5;
        canSubmit = false;
        percentWidth = 0.0;

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
        canSubmit = false;
      });
    } else {
      // Navigator.pop(context, 1);
      setState(() {
        showMessage = 3;
      });
    }
  }

  void chooseAnswer(int index) {
    setState(() {
      canSubmit = true;
      for (int i = 0; i < answer.length; i++) {
        answer[i]['isChoose'] = false;
      }
      answer[index]['isChoose'] = true;
    });
  }

  void checkAnswer() {
    dynamic check = answer.firstWhere((e) => e["isChoose"]);
    dynamic checkCorrect = answer.firstWhere((e) => e["isTrue"]);
    setState(() {
      if (check["isTrue"]) {
        showMessage = 1;
        if(percentWidth == 0.0){
          percentWidth = 1 / listQuestion.length;
        }else{
          percentWidth += 1 / listQuestion.length;
        }
      } else {
        answerCorrect = checkCorrect["name"];
        showMessage = 2;
        totalHeart--;
      }
    });
  }

  void checkCorrect(bool status) {
    setState(() {
      showMessage = status ? 1 : 2;
    });
  }

  void outScreen() {
    setState(() {
      showMessage = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if(showMessage == 0){
              outScreen();
            }
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
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        widthFactor: percentWidth,
                        child: Container(
                          height: 18,
                          decoration: BoxDecoration(
                              color: percentWidth > 0.7 ? const Color.fromRGBO(22, 182, 32, 1.0) : percentWidth > 0.4 ? const Color.fromRGBO(
                                  182, 174, 22, 1.0) : const Color.fromRGBO(
                                  182, 51, 22, 1.0),
                              borderRadius: BorderRadius.circular(9)),
                        ),
                      ),
                    ],
                  ),
                ),
                if (percentWidth > 0.1)
                  Positioned(
                    top: 4,
                    left: 6,
                    child: Container(
                      width: 150 * percentWidth,
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
                            color: Color.fromRGBO(255, 255, 255, 0.3),
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
      body: Stack(
        children: [
          Container(
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
                                        if (showMessage == 0) {
                                          chooseAnswer(index);
                                        }
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
                                    backgroundColor: !canSubmit
                                        ? const Color.fromRGBO(94, 94, 94, 1.0)
                                        : const Color.fromRGBO(67, 203, 47, 1.0),
                                    // backgroundColor: const Color.fromRGBO(94, 94, 94, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  onPressed: () {

                                    if (canSubmit) {
                                      checkAnswer();
                                    }

                                    // Navigator.pop(context, 1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'Kiểm tra',
                                      style: TextStyle(
                                          color: !canSubmit
                                              ? const Color.fromRGBO(134, 134, 134, 1.0)
                                              : Colors.black,
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
                        if(totalHeart > 0){
                          nextQuestion(false);
                        }else{
                          setState(() {
                            showMessage = 5;
                          });
                        }
                      },
                      answer: answerCorrect)
              ],
            ),
          ),
          if (showMessage == 4 || showMessage == 3 || showMessage == 5)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromRGBO(59, 59, 59, 0.4),
            ),
          if (showMessage == 3)
            MessageNextTitleScreen(
              onTap: () {
                Navigator.pop(context, 1);
              },
              title: "Trả lời câu hỏi!",
            ),
          if (showMessage == 4)
            MessageOutScreen(
              onTapExit: () {
                Navigator.pop(context);
              },
              onTapContinue: () {
                setState(() {
                  showMessage = 0;
                });
              },
            ),
          if (showMessage == 5)
            GameOverScreen(
              onTapExit: () {
                Navigator.pop(context);
              },
              onTapContinue: () {
                fetchData();
              },
            ),
        ],
      ),
    );
  }
}
