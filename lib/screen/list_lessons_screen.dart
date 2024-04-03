import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/list_lesson.controller.dart';

class ListLessonsScreen extends StatefulWidget {
  final codeUser;

  const ListLessonsScreen({super.key, this.codeUser});
  @override
  State<StatefulWidget> createState() {
    return ViewListLesson();
  }
}

class ViewListLesson extends State<ListLessonsScreen> {
  List<dynamic> listLesson = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await ListLesson.getListLesson();
      setState(() {
        listLesson = data;
      });
    } catch (e) {
      print('Error: $e');
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Danh sách bài học',
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
                image: const AssetImage('giaodien3.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                )),
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('luaphai.png'),
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        // Border
                        Text(
                          '20',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 10 // Độ dày của border
                              ..color = const Color.fromRGBO(
                                  72, 123, 232, 1.0), // Màu của border
                          ),
                        ),
                        // Text
                        const Text(
                          '20',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Màu của chữ
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('luatrai.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cùng nhau ôn lại bài nhé',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listLesson.length,
                  itemBuilder: (context, index) {
                    var lesson = listLesson[index];
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(75, 75, 75, 1),
                                  // minimumSize: const Size(double.infinity,0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Bài 1 :  ',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          lesson['name'],
                                          style: const TextStyle(
                                              fontSize: 20, color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(29, 106, 122, 1.0),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                        )
                      ],
                    );
                    // return Text('data',style: TextStyle(color: Colors.white),);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
