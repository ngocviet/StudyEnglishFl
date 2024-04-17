import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/controllers/statistical_controller.dart';
import 'package:project4/screen/list_lessons_screen.dart';
import 'package:project4/screen/list_vocabulary_screen.dart';
import '../model_views/model_statistical.dart';

class StatisticalScreen extends StatefulWidget {
  final String codeUser;

  const StatisticalScreen({super.key, required this.codeUser});

  @override
  State<StatisticalScreen> createState() => _StatisticalScreenState();
}

class _StatisticalScreenState extends State<StatisticalScreen> {
  int totalWord = 0;
  int totalQuestion = 0;
  String listWord = "";
  String listQuestionString = "";
  String time = "";
  int totalNewWord = 0;
  int totalNewQues = 0;
  int totalOldWord = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await StatisticalController.getInfoData(widget.codeUser);

      setState(() {
        totalWord = data['totalWord'];
        totalQuestion = data['totalQuestion'];
        totalNewWord = data['totalNewWord'];
        totalNewQues = data['totalNewQues'];
        totalOldWord = data['totalOldWord'];
        listWord = data['listWordString'];
        listQuestionString = data['listQuestionString'];
        time = data['time'];
      });
    } catch (e) {
      print('Error: StatisticalScreen $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(width: 0,),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Thống kê học tập',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(width: 40,),
          ],
        ),
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(50, 50, 50, 1.0)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              width: double.infinity,
              color: const Color.fromRGBO(50, 50, 50, 1.0),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListVocabularyScreen(
                                    codeUser: widget.codeUser,
                                  )),
                        );
                      },
                      child: Row(
                        children: [
                          Item1(
                            title: 'Ôn lại các từ',
                            content: listWord,
                            img: 'handle.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListLessonsScreen(
                                    codeUser: widget.codeUser,
                                  )),
                        );
                      },
                      child: Row(
                        children: [
                          Item1(
                            title: 'Bài tập trắc nghiệm',
                            content: listQuestionString,
                            img: 'book.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Text(
                                  'Bộ sưu tập của bạn',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      fontStyle: FontStyle.normal),
                                )),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 00, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListVocabularyScreen(
                                                      codeUser: widget.codeUser,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  45, 45, 45, 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: const Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 3))),
                                          child: Center(
                                            child: Text(
                                              '$totalWord từ',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      )),
                                      const SizedBox(width: 20),
                                      Expanded(
                                          child: GestureDetector(
                                              child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListLessonsScreen(
                                                      codeUser: widget.codeUser,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  45, 45, 45, 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: const Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 3))),
                                          child: Center(
                                            child: Text(
                                              '$totalQuestion câu hỏi',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      )))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Hôm nay',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      fontStyle: FontStyle.normal)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.lock_clock,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(time,
                                        style: const TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          // height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Row(
                                  children: [
                                    Item3(
                                        total: totalNewWord,
                                        status: totalNewWord > 10
                                            ? 'Tuyệt'
                                            : totalNewWord > 0
                                                ? 'Tốt'
                                                : '...',
                                        title: 'Từ mới đã học'),
                                    Item3(
                                        total: totalNewQues,
                                        status: totalNewQues > 10
                                            ? 'Tuyệt'
                                            : totalNewQues > 0
                                                ? 'Tốt'
                                                : '...',
                                        title: 'Bài tập đã làm'),
                                    Item3(
                                        total: totalOldWord,
                                        status: totalOldWord > 10
                                            ? 'Tuyệt'
                                            : totalOldWord > 0
                                                ? 'Tốt'
                                                : '...',
                                        title: 'Từ đã ôn'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  final String title;
  final String content;
  final String img;

  const Item1({
    Key? key,
    required this.title,
    required this.content,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromRGBO(85, 85, 85, 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(119, 0, 192, 1.0),
                        ),
                        child: Text(
                          content,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  final int total;
  final String status;
  final String title;

  const Item3(
      {super.key,
      required this.total,
      required this.status,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 180,
        height: 220,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(45, 45, 45, 1.0),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Column(
            children: [
              Text(status,
                  style: const TextStyle(
                      color: Color.fromRGBO(160, 100, 255, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontStyle: FontStyle.italic)),
              Text('$total',
                  style: const TextStyle(
                      color: Color.fromRGBO(160, 100, 255, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontStyle: FontStyle.italic)),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontStyle: FontStyle.italic)),
              Padding(
                padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
