import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project4/controllers/home_controller.dart';
import 'package:project4/models/account.dart';
import 'package:project4/models/lesson.dart';
import 'package:project4/screen/choose_title_screen.dart';
import 'package:project4/screen/choose_topic_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Variables
  int totalDay = 0;
  String topic = "";
  int idTopic = 1;
  List<Lesson> listLesson = [];
  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    totalDay = await HomeController.getDay();
    listLesson = await HomeController.getListLesson(1, 1);
    try {
      final data = await HomeController.getDataTopic(idTopic);
      setState(() {
        topic = 'Chủ đề ${data['stt']}';
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('htv_preview_rev_1.png'),
                      fit: BoxFit.contain),
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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 850,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('back1.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  )),
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Center(
                            child: Container(
                              width: 260,
                              height: 260,
                              decoration: const BoxDecoration(
                                // color: Colors.red,
                                  image: DecorationImage(
                                    image: AssetImage('header.png'),
                                    fit: BoxFit.contain,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 50,
                                      // color: Colors.blue,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const IconButton(
                                            onPressed: null,
                                            padding: EdgeInsets.all(0),
                                            icon: Icon(
                                              Icons.local_fire_department_rounded,
                                              color: Colors.orangeAccent,
                                              size: 50,
                                            ),
                                          ),
                                          Center(
                                            child: Stack(
                                              children: [
                                                Text(
                                                  '$totalDay',
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..style = PaintingStyle.stroke
                                                      ..strokeWidth = 6 // Độ dày của border
                                                      ..color = Colors.orangeAccent, // Màu của border
                                                  ),
                                                ),
                                                Text(
                                                  '$totalDay',
                                                  style: const TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white, // Màu của chữ
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0, right: 2),
                                      child: Text(
                                        'Chuỗi ngày',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => ChooseTopicScreen(idUser: 1)),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(9),
                                            child: Text(
                                              topic,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            )))),
                Expanded(
                    flex: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: listLesson.length,
                      itemBuilder: (BuildContext context, int index) {
                        var lesson = listLesson[index];
                        double leftPadding = index == 0 ? 70 : 40;
                        double rightPadding = index == listLesson.length - 1 ? 65 : 0;
                        return Padding(
                          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
                          child: Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 8,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(lesson.img),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      lesson.sttLesson,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(205, 205, 205, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 160,
                                    child: Text(
                                      lesson.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 40),
                                    width: 220,
                                    height: 70,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: const IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.star_border_rounded,
                                                size: 75,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: const IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.star_border_rounded,
                                                size: 75,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: const IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                Icons.star_border_rounded,
                                                size: 75,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              ChooseTitleScreen(model: listLesson[index])
                                            // ListVocabularyScreen()
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(13.0),
                                        child: Text(
                                          'Bắt đầu',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}
