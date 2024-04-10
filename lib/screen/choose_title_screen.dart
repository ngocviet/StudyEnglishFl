import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:project4/controllers/choose_title_controller.dart';
import 'package:project4/screen/answer_the_question_screen.dart';
import 'package:project4/screen/combine_sentences_screen.dart';
import 'package:project4/screen/learn_word_screen.dart';
import 'package:project4/screen/notification_result_screen.dart';

class ChooseTitleScreen extends StatefulWidget {
  final String codeUser;
  final String codeLesson;
  final String sttLesson;
  final String title;
  const ChooseTitleScreen(
      {super.key,
      required this.codeLesson,
      required this.sttLesson,
      required this.title, required this.codeUser});

  @override
  State<ChooseTitleScreen> createState() => _ChooseTitleScreenState();
}

class _ChooseTitleScreenState extends State<ChooseTitleScreen> {
  int totalWord = 0;
  int totalQuestion = 0;
  int totalPuzzle = 0;
  int totalCorrectW = 10;
  int totalCorrectQ = 10;
  int totalCorrectP = 10;
  List<bool> isComplete = [false, false, false];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final rs = await ChooseTileController.getDataFromApi(widget.codeLesson);

      setState(() {
        totalWord = rs['totalWord'];
        totalQuestion = rs['totalQuestion'];
        totalPuzzle = rs['totalPuzzle'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void changeStatusItem(int index) {
    if(index != null){
      setState(() {
        isComplete[index] = true;
      });
    }
  }

  void checkComplete(){
    if(isComplete[0]){
      int total = totalCorrectW + totalCorrectQ +totalCorrectP;
      int pW = (totalCorrectW / totalWord * 100).round().toInt();
      int pQ = (totalCorrectQ / totalWord * 100).round().toInt();
      int pP = (totalCorrectP / totalWord * 100).round().toInt();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NotificationResultScreen(codeUser: widget.codeUser,pass: total,miss: 1,percentW: pW,percentQ: pQ,percentP: pP,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // modelChooseTile item = ChooseTileController.getDetail(widget.idLesson);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Học Tập',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              width: 70,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('htv_preview_rev_1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
            image: const AssetImage('giaodien2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.sttLesson,
                        style:
                            const TextStyle(color: Colors.amber, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LearnWordScreen(codeLesson: widget.codeLesson, UserCode: "")),
                ).then((result) {
                  if (result != null) {
                    int index = result["index"];
                    int value = result["totalCorrect"];
                    setState(() {
                      totalCorrectW = value;
                    });
                    changeStatusItem(index);
                  }
                  checkComplete();
                });
              },
              child: Item(
                imageUrl: 'abc1.jpg',
                title: 'Học từ vựng',
                total: totalWord,
                isComplete: isComplete[0],
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnswerTheQuestionScreen(
                          CodeLesson: widget.codeLesson, UserCode: "")),
                ).then((index) {
                  changeStatusItem(index);
                });
              },
              child: Item(
                imageUrl: 'hoicham2.png',
                title: 'Trả lời câu hỏi',
                total: totalQuestion,
                isComplete: isComplete[1],
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                if (totalPuzzle > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CombineSentencesScreen()),
                  ).then((index) {
                    changeStatusItem(index);
                  });
                }
              },
              child: Item(
                imageUrl: 'ghepcau1.jpg',
                title: 'Ghép câu có ý nghĩa',
                total: totalPuzzle,
                isComplete: isComplete[2],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int total;
  final bool isComplete;

  const Item({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.total,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 370,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(143, 138, 138, 0.5),
              border: Border.all(
                  color: isComplete
                      ? const Color.fromRGBO(99, 197, 106, 1.0)
                      : const Color.fromRGBO(143, 138, 138, 1.0),
                  width: 2)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            height: 130,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: -5,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isComplete
                              ? const Color.fromRGBO(99, 197, 106, 1.0)
                              : const Color.fromRGBO(229, 62, 85, 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '$total',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    if (total == 0)
                      Positioned(
                        top: -20,
                        right: -5,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(155, 155, 155, 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (total == 0)
          Container(
            width: 370,
            height: 150,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(155, 155, 155, 0.6),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
      ],
    );
  }
}
