import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/model_views/model_combine_sentences.dart';

import '../controllers/combine_sentences_controller.dart';
import '../models/word.dart';

class CombineSentencesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<CombineSentencesScreen> {

  String _selectedButtonText = '';
  List<Word> listWord = [];
  List<Word> listWordAdd = [];
  @override
  Widget build(BuildContext context) {
    modelCombineSentences data = CombineSentencesController.getData();
    listWord = data.listWord;
    return Scaffold(
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
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(75, 75, 75, 1),
                ),
                height: 15,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
              child: Container(
                child: const Text(
                  'Tạo một cụm từ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 2))),
                        child: Text(data.nameVn,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 20, 30),
                    child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Column(
                          children: [
                            Row(
                              children: List.generate(listWordAdd.length, (index) {
                                Word word = listWordAdd[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5), // Khoảng cách 20px giữa mỗi Text
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.white, // Màu sắc của gạch chân
                                          width: 1.0, // Độ dày của gạch chân
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      word.nameEn, // Hiển thị dữ liệu của ElevatedButton được click
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 100, bottom: 0, right: 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 20,
                      children: List.generate(
                        listWord.length,
                        (index) {
                          Word word = listWord[index];
                          return
                            SizedBox(
                              child: word.isShowText
                                  ? ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    word.isShowText = false;
                                    _selectedButtonText = word.nameEn;
                                    Word newWord = Word(
                                      nameEn: word.nameEn,
                                      nameVn: '',
                                      isShowText: false,
                                    );
                                    listWordAdd.add(newWord);
                                  });
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(75, 75, 75, 1),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    word.nameEn,
                                    style: const TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              )
                                  : SizedBox(), // Ẩn ElevatedButton nếu word.isShowText là false
                            );

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              // style: ButtonStyle(backgroundColor: ),
                onPressed: () {

                }, child: const Text('Kiểm tra',style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
