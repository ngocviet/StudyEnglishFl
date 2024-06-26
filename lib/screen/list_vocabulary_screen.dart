import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../controllers/list_vocabulary_controller.dart';
import 'dart:math' as math;

class ListVocabularyScreen extends StatefulWidget {
  final String codeUser;
  ListVocabularyScreen({super.key, required this.codeUser});

  @override
  State<ListVocabularyScreen> createState() => _ListVocabularyScreenState();
}

class _ListVocabularyScreenState extends State<ListVocabularyScreen> {
  FlutterTts flutterTts = FlutterTts();
  int indexSelected = 0;
  bool status = false;
  int totalNumber= 0;
  int wordsBeingStudied= 0;
  int wordsLearned= 0;
  List<dynamic> listWord = [];
  List<bool> showNameVN = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final data = await ListVocabularyScreenController.getListWord(widget.codeUser, status);

       final data1  = await ListVocabularyScreenController.infoTotalWord(widget.codeUser);
      setState(() {
        listWord = data;
        showNameVN = List.filled(data.length, false);
        totalNumber = data1['totalNumber'];
        wordsLearned = data1['wordsLearned'];
        wordsBeingStudied = data1['wordsBeingStudied'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void changeTab(int index, bool isRemomerize){
    setState(() {
      indexSelected = index;
      status = isRemomerize;
    });
    fetchData();
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
                'Từ vựng của bạn',
                style: TextStyle(
                    fontSize: 22,
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
                          '$totalNumber',
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
                          '$totalNumber',
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
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 30),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(90, 90, 90, 1.0),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: GestureDetector(
                            onTap: () {
                              changeTab(0, false);
                            },
                            child: Item(title: 'Tôi đang học $wordsLearned từ', index: 0, indexSelected: indexSelected)
                        ),

                      ),
                      Expanded(
                        flex:1,
                        child: GestureDetector(
                            onTap: () {
                              changeTab(1, true);
                            },
                            child: Item(title: 'Đã học $wordsBeingStudied từ', index: 1, indexSelected: indexSelected)),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Đã đến lúc để ôn lại',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: listWord.length,
                      itemBuilder: (BuildContext context, int index) {
                        var word = listWord[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(75, 75, 75, 1.0),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        word['nameEN'],
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                    IconButton(onPressed: () {
                                      setState(() {
                                        showNameVN[index] = !showNameVN[index]; // Khi IconButton được nhấn, set showVNWord thành true để hiển thị từ tiếng Việt
                                      });
                                    }, icon: const Icon(
                                      Icons.swap_horiz,
                                      color: Colors.grey,
                                      size: 30,
                                    )),
                                    if (showNameVN[index])
                                      Text(word['nameVN'],
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),),
                                    const Spacer(),
                                    Stack(
                                        children:[
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(119, 119, 119, 1.0),
                                                  width: 3,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                size: 22,
                                                 color: word['wordCount'] != word['wordTotalCount'] ? const Color.fromRGBO(119, 119, 119, 1.0) : Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 39,
                                              height: 39,
                                              child: CustomPaint(
                                                painter:
                                                 HalfRedHalfBlueBorderCirclePainter(wordCount: word['wordCount'],wordTotalCount: word['wordTotalCount']),
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: IconButton(
                                          onPressed: () async {
                                            await flutterTts.setLanguage("en-US");
                                            await flutterTts.setPitch(5);
                                            await flutterTts.speak(word['nameEN']);
                                          },
                                          icon: const Icon(
                                            Icons.volume_up_rounded,
                                            color: Colors.grey,
                                            size: 30,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        );
                      },
                                        ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ElevatedButton(
                            onPressed: (){
                              null;
                            },
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: const Color.fromRGBO(66, 125,
                              //     173,
                              //     1.0)
                              backgroundColor: const Color.fromRGBO(93, 93,
                                  93,
                                  1.0)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('Học ngay', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(
                                  161, 161, 161, 1.0)),),
                            )
                        ),
                      ),
                    )
                ]),
              )
            ],
          ),
        ));
  }
}


class HalfRedHalfBlueBorderCirclePainter extends CustomPainter {
  late final int wordCount;
  late final int wordTotalCount;

  HalfRedHalfBlueBorderCirclePainter({required this.wordCount, required this.wordTotalCount});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 10;

    double halfWidth = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = math.min(halfWidth, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      80,
      2 * math.pi * wordCount / wordTotalCount,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Item extends StatelessWidget {
  final String title;
  final int index;
  final int indexSelected;

  const Item({super.key, required this.title, required this.index, required this.indexSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: index == indexSelected ? const Color.fromRGBO(18, 189, 117, 1.0) : const Color.fromRGBO(90, 90, 90, 1.0),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

