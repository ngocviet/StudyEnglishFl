import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/controllers/learn_word_controller.dart';
import 'package:project4/screen/message/message_next_title_screen.dart';
import 'package:project4/screen/message/success_screen.dart';
import 'package:project4/screen/message/un_success_screen.dart';

class LearnWordScreen extends StatefulWidget {
  final String codeLesson;
  LearnWordScreen({super.key, required this.codeLesson});

  @override
  State<StatefulWidget> createState() {
    return ViewScreen();
  }
}

class ViewScreen extends State<LearnWordScreen> {
  late String nameEN = "";
  late String nameVN = "";
  late String avatar = "default.jpg";
  List<dynamic> listAnswer = [];
  int stt = 0;
  int totalHeart = 3;
  int showMessage = 0;
  bool canSubmit = false;
  String answerCorrect = "";
  List<dynamic> dataMain = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await learnWordController.getDataQuestion(widget.codeLesson);

      setState(() {
        dataMain = data;
        nameEN = data[stt]['nameEN'];
        listAnswer = data[stt]['listAnswer'];
        canSubmit = false;
        showMessage = 0;
      });
      bool isExists = await doesAssetExist('assets/${data[stt]['avatar']}');
      if (isExists) {
        setState(() {
          avatar = data[stt]['avatar'];
        });
      } else {
        setState(() {
          avatar = "default.jpg";
        });
      }
    } catch (e) {
      print('Error: fetchData $e');
    }
  }

  void next() async {
    stt++;
    if (stt <= listAnswer.length) {
      setState(() {
        nameEN = dataMain[stt]['nameEN'];
        listAnswer = dataMain[stt]['listAnswer'];
        canSubmit = false;
        showMessage = 0;
      });
      bool isExists = await doesAssetExist('assets/${dataMain[stt]['avatar']}');
      if (isExists) {
        setState(() {
          avatar = dataMain[stt]['avatar'];
        });
      } else {
        setState(() {
          avatar = "default.jpg";
        });
      }
    } else {
      setState(() {
        showMessage = 3;
      });
      // Navigator.pop(context, 0);
    }
  }

  void chooseAnswer(int index) {
    setState(() {
      canSubmit = true;
      for (int i = 0; i < listAnswer.length; i++) {
        listAnswer[i]['isChoose'] = false;
      }
      listAnswer[index]['isChoose'] = true;
    });
  }

  void checkAnswer() {
    dynamic check = listAnswer.firstWhere((e) => e["isChoose"]);
    dynamic checkCorrect = listAnswer.firstWhere((e) => e["isCorrect"]);
    if (check["isCorrect"]) {
      setState(() {
        showMessage = 1;
      });
    } else {
      setState(() {
        answerCorrect = checkCorrect["nameVN"];
        showMessage = 2;
        totalHeart--;
      });
    }
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(2, 33, 47, 1.0),
        ),
        child: Stack(children: [
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Chọn bản dịch đúng',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.messenger_outline_sharp,
                            size: 70,
                            color: Color.fromRGBO(82, 79, 79, 1.0),
                          ),
                          onPressed: () {
                            null;
                          },
                        ),
                        Positioned(
                          top: 14,
                          left: 40,
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 3, bottom: 2, right: 20),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(2, 33, 47, 1.0),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(82, 79, 79, 1.0),
                                    width: 5,
                                  ),
                                  top: BorderSide(
                                    color: Color.fromRGBO(79, 79, 79, 1.0),
                                    width: 5,
                                  ),
                                  right: BorderSide(
                                    color: Color.fromRGBO(79, 79, 79, 1.0),
                                    width: 5,
                                  ),
                                )),
                            child: Text(
                              nameEN,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 0, bottom: 40, right: 20),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                        image: AssetImage(avatar), fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: listAnswer.length,
                        // reverse: true,
                        itemBuilder: (context, index) {
                          var answer = listAnswer[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(75, 75, 75, 0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  side: BorderSide(
                                      color: !answer['isChoose']
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
                                    answer['nameVN'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !canSubmit
                                  ? const Color.fromRGBO(94, 94, 94, 1.0)
                                  : const Color.fromRGBO(67, 203, 47, 1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              if (canSubmit) {
                                checkAnswer();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'Kiểm tra',
                                style: TextStyle(
                                    color: !canSubmit
                                        ? const Color.fromRGBO(
                                            134, 134, 134, 1.0)
                                        : Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          if (showMessage == 1)
            SuccessScreen(onTap: () {
              next();
            }),
          if (showMessage == 2)
            UnSuccessScreen(
                onTap: () {
                  next();
                },
                answer: answerCorrect),
          if (showMessage == 3)
            MessageNextTitleScreen(
                onTap: () {
                  Navigator.pop(context, 0);
                },
                title: "Học từ vựng!",),
        ]),
      ),
    );
  }
}

Future<bool> doesAssetExist(String assetName) async {
  try {
    await rootBundle.load(assetName);
    return true;
  } catch (_) {
    return false;
  }
}
