import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/controllers/learn_word_controller.dart';

class LearnWordScreen extends StatefulWidget {
  final String codeLesson;
  final int stt;
  LearnWordScreen({super.key, required this.codeLesson, required this.stt});

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
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await learnWordController.getDataQuestion(
          widget.codeLesson, widget.stt);

      setState(() {
        nameEN = data['nameEN'];
        // nameVN = data['nameVN'];
        listAnswer = data['listAnswer'];
      });
      bool isExists = await doesAssetExist('assets/${data['avatar']}');
      if (isExists) {
        setState(() {
          avatar = data['avatar'];
        });
      }
    } catch (e) {
      print('Error: $e');
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
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
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
                    color: const Color.fromRGBO(33, 197, 41, 1.0),
                    borderRadius: BorderRadius.circular(9)
                ),
              ),
            ]
          ),
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
        child: Column(
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(2, 33, 47, 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.messenger_outline_sharp, size: 70,color: Color.fromRGBO(82, 79, 79, 1.0),),
                          onPressed: () {
                            null;
                          },
                        ),
                        Positioned(
                          top: 14,
                          left: 40,
                          child: Container(
                            padding: const EdgeInsets.only(top: 3,bottom: 2, right: 20),
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
                              )
                            ),
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
                                  backgroundColor: const Color.fromRGBO(75, 75, 75, 0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                side: const BorderSide(color: Color.fromRGBO(
                                    90, 104, 129, 1.0), width: 3),
                              ),
                              onPressed: () {
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  answer['nameVN'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              )
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: const Color.fromRGBO(67, 203, 47,1.0),
                            backgroundColor: const Color.fromRGBO(
                                94, 94, 94, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                          onPressed: () {
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Kiểm tra',
                              style: TextStyle(
                                  // color: Colors.black,
                                  color: Color.fromRGBO(134, 134, 134, 1.0),
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
