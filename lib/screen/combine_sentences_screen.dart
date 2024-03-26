import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/model_views/model_combine_sentences.dart';
import 'package:project4/models/account.dart';

import '../controllers/combine_sentences_controller.dart';
import '../models/word.dart';

class CombineSentencesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<CombineSentencesScreen> {
  List<Word> listWord = [];
  List<Word> listWordAdd = [];
  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWidgets = listWord.map((word) {
      return ElevatedButton(
        onPressed: () {
          setState(() {
            Word newWord = Word(
              nameEn: word.nameEn,
              nameVn: '',
              isShowText: false,
            );
            listWordAdd.add(newWord);
            listWord.remove(word);
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
        child: Text(
          word.nameEn,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }).toList();

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
                          Wrap(
                            children: List.generate(
                              listWordAdd.length,
                              (index) {
                                Word word = listWordAdd[index];
                                return Visibility(
                                  visible: !word.isShowText,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 0,
                                        bottom:
                                            0), // Khoảng cách giữa mỗi TextButton
                                    child: TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white), // Màu chữ
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          // Tìm vị trí của từ được nhấn
                                          int currentIndex =
                                              listWordAdd.indexOf(word);
                                          // Đảo ngược trạng thái của word.isShowText
                                          word.isShowText = !word.isShowText;
                                          if (word.isShowText) {
                                            // Nếu word.isShowText là true, di chuyển từ này lên trên cùng của danh sách
                                            Word removedWord = listWordAdd
                                                .removeAt(currentIndex);
                                            listWordAdd.insert(0, removedWord);
                                          } else {
                                            // Nếu word.isShowText là false, di chuyển từ này xuống cuối danh sách
                                            Word removedWord = listWordAdd
                                                .removeAt(currentIndex);
                                            listWordAdd.add(removedWord);
                                          }
                                        });
                                      },
                                      child: Text(
                                        word.nameEn,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          decoration: TextDecoration
                                              .underline, // Thêm gạch chân cho văn bản
                                          decorationColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(75, 75, 75, 1),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(200,
                        70), // Đặt chiều rộng và chiều cao cho ElevatedButton
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Kiểm tra',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}

