import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/model_views/model_combine_sentences.dart';
import 'package:project4/controllers/combine_sentences_controller.dart';
import 'package:project4/models/word.dart';

class CombineSentencesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CombineSentencesScreenState();
}

class _CombineSentencesScreenState extends State<CombineSentencesScreen> {
  late modelCombineSentences _data;
  int totalHeart = 3;
  int canSubmit = 0;

  @override
  void initState() {
    super.initState();
    _data = CombineSentencesController.getData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWidgets = _data.listWord.map((word) {
      return Visibility(
        visible: word.isShowText,
        child: ElevatedButton(
            key: UniqueKey(),
            onPressed: () {
              setState(() {
                // _data = CombineSentencesController.getData1();
                word.isShowText = !word.isShowText;
                canSubmit ++;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(2, 32, 47, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Color.fromRGBO(
                  145, 161, 189, 1.0), width: 2),
            ),
            child:
            Padding(
              padding: const EdgeInsets.fromLTRB(5,10,5,10),
              child: Text(
                word.nameEn,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            )

        ),
      );
    }).toList();
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
              child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 18,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(197, 206, 215, 1.0),
                          borderRadius: BorderRadius.circular(9)
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 18,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(22, 182, 32, 1.0),
                          borderRadius: BorderRadius.circular(9)
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 15,
                      child: Container(
                        width: 70,
                        height: 6,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    ),
                  ]
              ),
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
                        )
                    )
                  ],
                ),
                Text(
                  '$totalHeart',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
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
                              bottom: BorderSide(color: Color.fromRGBO(
                                  136, 136, 136, 1.0), width: 1),
                            ),
                          ),
                          child: Text(
                            _data.nameEn,
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
                              top: 30,
                              child: SizedBox(
                                width: 400,
                                child: Wrap(
                                  runSpacing: 30,
                                  children: List.generate(
                                    _data.listWord.length,
                                        (index) {
                                      Word word = _data.listWord[index];
                                      return Visibility(
                                        visible: !word.isShowText,
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              word.isShowText = !word.isShowText;
                                              canSubmit --;
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 8),
                                            child: Text(
                                              word.nameEn,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 60,
                                child: Container(
                                  height: 1,
                                  width: 400,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey
                                  ),
                                )
                            ),
                            Positioned(
                              top: 120,
                                child: Container(
                                  height: 1,
                                  width: 600,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 200,
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
                        backgroundColor: canSubmit >= 2 ? const Color.fromRGBO(67, 203, 47,1.0) : const Color.fromRGBO(
                            94, 94, 94, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Kiểm tra',
                          style: TextStyle(
                              color: canSubmit >= 2 ? Colors.black : const Color.fromRGBO(134, 134, 134, 1.0),
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
