import 'package:flutter/material.dart';
import 'package:project4/controllers/choose_title_controller.dart';
import 'package:project4/model_views/model_choose_title.dart';
import 'package:project4/models/lesson.dart';

class ChooseTitleScreen extends StatelessWidget {
  final Lesson model;

  const ChooseTitleScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    modelChooseTile item = ChooseTileController.getDetail(model.id);
    return Scaffold(
      appBar: AppBar(
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
                Colors.black.withOpacity(0.4), BlendMode.darken),
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
                        model.sttLesson,
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
                          model.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 370,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 130,
                          width: 120,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, // Sử dụng hình tròn
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('abc1.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(width: 30),
                        const Text(
                          "Học từ vựng",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 370,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 120,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, // Sử dụng hình tròn
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('hoicham2.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Trả lời câu hỏi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 370,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle, // Sử dụng hình tròn
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage('ghepcau1.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Ghép câu có ý nghĩa",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
