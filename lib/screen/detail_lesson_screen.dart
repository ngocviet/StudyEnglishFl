import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/controllers/detail_lesson_controller.dart';

class DetailLessonScreen extends StatefulWidget {
  final String lessonCode;
  const DetailLessonScreen({super.key, required this.lessonCode});

  @override
  State<StatefulWidget> createState() {
    return ViewDetailLesson();
  }
}

class ViewDetailLesson extends State<DetailLessonScreen> {
  bool showChild = false;
  String title = "";
  int total = 0;
  int selectedIndex = -1;
  List<dynamic> dataDetailLesson = [];
  List<bool> showAnswers = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final detail = await DetailLessonController.getDetailLesson(widget.lessonCode);
      setState(() {
        title = detail["title"];
        total = detail["total"];
        dataDetailLesson = detail["data"];
        showAnswers = List.filled(dataDetailLesson.length, false);
      });
    } catch (e) {
      print('Error:hi $e');
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
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Câu hỏi của bạn",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
              const SizedBox(
                height: 20,
              ),
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
                        Text(
                          total.toString(),
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
                        Text(
                          total.toString(),
                          style: const TextStyle(
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
              SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: dataDetailLesson.length,
                    itemBuilder: (context, index) {
                      var item = dataDetailLesson[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showAnswers[index] = !showAnswers[index];
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color.fromRGBO(80, 75, 75, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                                  child: Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            item["question"],
                                            style: const TextStyle(fontSize: 20, color: Colors.white),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Icon(
                                          showAnswers[index] ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down,
                                          size: 25,
                                          color: Colors.white,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (showAnswers[index])
                            Container(
                                width: double.infinity,
                                height: item["listAnswer"].length * 40 + 10,
                                padding: const EdgeInsets.fromLTRB(8,8,8,0),
                                child: ListView.builder(
                                  itemCount: item["listAnswer"].length,
                                  itemBuilder: (context, index) {
                                    var item2 = item["listAnswer"][index];
                                    return SizedBox(
                                        height: 40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20, right: 20),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: item2["isTrue"]
                                                      ? Colors.green
                                                      : const Color.fromRGBO(
                                                      103, 103, 103, 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
                                                  child: Text(
                                                    "${index + 1}.  ${item2["answer"]}",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                )),
                        ],
                      );
                    },
                  ))
            ],
          ),
        ));
  }
}
