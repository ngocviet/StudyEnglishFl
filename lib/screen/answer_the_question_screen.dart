import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/answer_the_question_controller.dart';
import '../models/answer.dart';

class AnswerTheQuestionScreen extends StatefulWidget {
  const AnswerTheQuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScreenState();
  }
}

class ScreenState extends State<AnswerTheQuestionScreen> {
  List<dynamic> listAnswer = [];
  String question = '';
  String avatar = '';
  int showSuccessMessage = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final dataQuestion = await AnswerTheQuestionController.getDataQuestion();

      final dataAnswer = await AnswerTheQuestionController.getDataAnswer();
      setState(() {
        listAnswer = dataAnswer;
        avatar = dataQuestion[0]["avatar"];
        question = dataQuestion[0]["question"];
      });
    } catch (e) {
      print('Error: screen $e');
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(75, 75, 75, 1),
                ),
                height: 15,
                width: 250,
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(75, 75, 75, 1),
                  shape: BoxShape.circle,
                ),
                height: 40,
                width: 40,
                child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    )),
              )
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
                    child: Text(
                      'Trả lời câu hỏi',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Đảm bảo các phần tử con được căn chỉnh theo đầu dòng
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 20,
                                  50), // Điều chỉnh padding cho phù hợp
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxWidth: double.infinity),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  question,
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 0, bottom: 0, right: 20),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(avatar), fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        listAnswer.length,
                        (index) {
                          var answer = listAnswer[index];
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 20,
                                  bottom: 0,
                                  right: 20), // Khoảng cách giữa mỗi TextButton
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // showSuccessMessage = answer['isTrue'];
                                        if(answer['isTrue'] == true){
                                          showSuccessMessage = 1;
                                        }else{
                                          showSuccessMessage = 2;
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        answer['answer'],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    )),
                              ));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showSuccessMessage == 1) // Kiểm tra điều kiện để hiển thị container
              Positioned(
                bottom: 0, // Đặt vị trí của container ở phía dưới màn hình
                left: 0,
                right: 0,
                height:
                    150, // Chiều cao của container là 1 nửa chiều cao của màn hình
                child: Container(
                  color: const Color.fromRGBO(9, 21, 9, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(19, 243, 19, 1),
                                shape: BoxShape
                                    .circle, // Hình dạng của icon là hình tròn
                              ),
                              child: const Center(
                                child: Icon(Icons.check,
                                    color:
                                        Color.fromRGBO(9, 21, 9, 1)), // Icon hình tích (tick)
                              ),
                            ),
                            const SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            const Text('Tuyệt vời !',
                                style: TextStyle(
                                    color: Color.fromRGBO(19, 243, 19, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)), // Text
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: const Color.fromRGBO(19, 243, 19, 1),
                            ),
                            onPressed: () {
                              setState(() {
                                showSuccessMessage = 0;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Tiếp Tục',
                                style: TextStyle(
                                  color: Color.fromRGBO(9, 21, 9, 1),
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            if (showSuccessMessage == 2) // Kiểm tra điều kiện để hiển thị container
              Positioned(
                bottom: 0, // Đặt vị trí của container ở phía dưới màn hình
                left: 0,
                right: 0,
                height:
                230, // Chiều cao của container là 1 nửa chiều cao của màn hình
                child: Container(
                  color: const Color.fromRGBO(9, 21, 9, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(243, 10, 10, 1),
                                shape: BoxShape
                                    .circle, // Hình dạng của icon là hình tròn
                              ),
                              child: const Center(
                                child: Icon(Icons.close,
                                    color:
                                    Color.fromRGBO(9, 21, 9, 1)), // Icon hình tích (tick)
                              ),
                            ),
                            const SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            const Text('Không chính xác!',
                                style: TextStyle(
                                    color: Color.fromRGBO(243, 10, 10, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)), // Text
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            Text('Câu trả lời đúng là:',
                                style: TextStyle(
                                    color: Color.fromRGBO(243, 10, 10, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 5), // Khoảng cách giữa icon và text
                            Text('4 people',
                                style: TextStyle(
                                    color: Color.fromRGBO(243, 10, 10, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(Size(200,60)),
                                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(243, 10, 10, 1)), // Màu nền của button
                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20), // Đặt bo góc thành 0 để tạo thành hình vuông
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  showSuccessMessage =0;
                                });
                              },
                              child: const Text('Đã hiểu',style: TextStyle(color: Color.fromRGBO(9, 21, 9, 1),fontSize: 24),)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
