import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:project4/controllers/choose_title_controller.dart';
import 'package:project4/model_views/model_choose_title.dart';
import 'package:project4/screen/learn_word_screen.dart';

class ChooseTitleScreen extends StatefulWidget {
  final int idLesson;
  final String sttLesson;
  final String title;
  const ChooseTitleScreen({super.key, required this.idLesson, required this.sttLesson, required this.title});

  @override
  State<ChooseTitleScreen> createState() => _ChooseTitleScreenState();
}

class _ChooseTitleScreenState extends State<ChooseTitleScreen> {
  int totalWord = 0;
  int totalQuestion = 0;
  int totalPuzzle = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final rs = await ChooseTileController.getDataFromApi(widget.idLesson);

      setState(() {
        totalWord = rs['totalWord'];
        totalQuestion = rs['totalQuestion'];
        totalPuzzle = rs['totalPuzzle'];
      });
    } catch (e) {
      print('Error: $e');
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('giaodien2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
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
                        style: const TextStyle(color: Colors.amber, fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          widget.title,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearnWordScreen()),
                );
              },
              child: Item(
                imageUrl: 'abc1.jpg',
                title: 'Học từ vựng',
                total: totalWord,
              ),
            ),
            const SizedBox(height: 50),
            Item(
              imageUrl: 'hoicham2.png',
              title: 'Trả lời câu hỏi',
              total: totalQuestion,
            ),
            const SizedBox(height: 50),
            Item(
              imageUrl: 'ghepcau1.jpg',
              title: 'Ghép câu có ý nghĩa',
              total: totalPuzzle,
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

  const Item({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '$total',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}