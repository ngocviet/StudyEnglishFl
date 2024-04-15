import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/model_views/model_combine_sentences.dart';
import 'package:project4/controllers/combine_sentences_controller.dart';
import 'package:project4/models/word.dart';
import 'package:project4/screen/message/game_over_screen.dart';
import 'package:project4/screen/message/message_next_title_screen.dart';
import 'package:project4/screen/message/message_out_screen.dart';
import 'package:project4/screen/message/success_screen.dart';
import 'package:project4/screen/message/un_success_screen.dart';

class CombineSentencesScreen extends StatefulWidget {
  final String codeUser;
  final String codeLesson;

  const CombineSentencesScreen({super.key, required this.codeLesson, required this.codeUser});
  @override
  State<StatefulWidget> createState() => _CombineSentencesScreenState();
}

class _CombineSentencesScreenState extends State<CombineSentencesScreen> {
  // late modelCombineSentences _data;
  List<dynamic> newWord = [];
  int totalHeart = 0;
  int stt = 0;
  int showMessage = 0;
  int totalCorrect = 0;
  int canSubmit = 0;
  double percentWidth = 0.0;
  String nameQuestion = "";
  String answerCorrect = "";
  List<dynamic> listData = [];
  List<dynamic> listAnswer = [];

  @override
  void initState() {
    super.initState();
    // _data = CombineSentencesController.getData();
    fetchData();
  }

  void fetchData() async{
    try {
      final rp = await CombineSentencesController.getListCombine(widget.codeLesson);
      setState(() {
        stt = 0;
        listData = rp;
        listAnswer = rp[stt]["listAnswer"];
        nameQuestion = rp[stt]["description"];
        answerCorrect = rp[stt]["name"];
        totalHeart = 3;
        percentWidth = 0.0;
        showMessage = 0;
        totalCorrect = 0;
      });
    } catch (e) {
      print('Error: fetchData combineSentences$e');
    }
  }

  void next() async {
    stt++;
    if (stt < listData.length) {
      setState(() {
        listAnswer = listData[stt]["listAnswer"];
        nameQuestion = listData[stt]["description"];
        answerCorrect = listData[stt]["name"];
        canSubmit = 0;
        showMessage = 0;
        newWord = [];
      });
    } else {
      setState(() {
        showMessage = 3;
      });
    }
  }

  void checkAnswer() {
    var check = newWord.map((e) => e["nameEn"]).join(" ");

    setState(() {
      if (check == answerCorrect) {
        showMessage = 1;
        totalCorrect += 1;
        if(percentWidth == 0.0){
          percentWidth = 1 / listData.length;
        }else{
          percentWidth += 1 / listData.length;
        }
      } else {
        showMessage = 2;
        totalHeart--;
      }
    });
  }

  void outScreen() {
    setState(() {
      showMessage = 4;
    });
  }

  void learnAgain(){
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> buttonWidgets = listAnswer.map((word) {
      return Visibility(
        visible: word["isShowText"],
        replacement: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 37, 8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(105, 105, 105, 1.0),
                width: 2
              )
            )
          ),
          child: Text(
            word["nameEn"],
            style: const TextStyle(color: Color.fromRGBO(2, 33, 47, 1.0), fontSize: 20),
          ),
        ),
        child: ElevatedButton(
          key: UniqueKey(),
          onPressed: () {
            setState(() {
              word["isShowText"] = !word["isShowText"];
              canSubmit++;
              newWord.add(word);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(2, 32, 47, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(
              color: Color.fromRGBO(145, 161, 189, 1.0),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Text(
              word["nameEn"],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );
    }).toList();

    List<Widget> newWordWidgets = newWord.map((word) {
      return GestureDetector(
        onTap: () {
          setState(() {
            word["isShowText"] = !word["isShowText"];
            canSubmit--;
            newWord.remove(word);
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 7, 24, 7),
            decoration: BoxDecoration(
              // color: Colors.red
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromRGBO(145, 161, 189, 1.0),
                width: 2
              )
            ),
            child: Text(
              word["nameEn"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      );
    }).toList();

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
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Hoàn thành câu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                              child: const Icon(
                                Icons.messenger,
                                color: Color.fromRGBO(183, 183, 183, 1.0),
                                size: 26,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(136, 136, 136, 1.0),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                nameQuestion,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 18,
                                  child: SizedBox(
                                    width: 400,
                                    child: Wrap(
                                      runSpacing: 30,
                                      children: newWordWidgets,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 70,
                                  child: Container(
                                    height: 1,
                                    width: 600,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 148,
                                  child: Container(
                                    height: 1,
                                    width: 600,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 240,
                          ),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: buttonWidgets,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: canSubmit > 2
                              ? const Color.fromRGBO(67, 203, 47, 1.0)
                              : const Color.fromRGBO(94, 94, 94, 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (canSubmit > 2) {
                            checkAnswer();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Kiểm tra',
                            style: TextStyle(
                              color: canSubmit > 2
                                  ? Colors.black
                                  : const Color.fromRGBO(134, 134, 134, 1.0),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showMessage != 0)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromRGBO(59, 59, 59, 0.4),
            ),
          if (showMessage == 1)
            SuccessScreen(onTap: () {
              next();
            }),
          if (showMessage == 2)
            UnSuccessScreen(
                onTap: () {
                  if(totalHeart > 0){
                    next();
                  }else{
                    setState(() {
                      showMessage = 5;
                    });
                  }
                },
                answer: answerCorrect),
          if (showMessage == 3)
            MessageNextTitleScreen(
              onTap: () {
                Navigator.pop(context, {"index": 2, "totalCorrect": totalCorrect});
              },
              title: "Ghép từ!",
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
                learnAgain();
              },
            ),
        ],
      ),
    );
  }
}
