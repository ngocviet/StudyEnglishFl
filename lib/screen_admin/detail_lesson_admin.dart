import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/controllers/lesson_admin_controller.dart';
import 'package:project4/controllers/profile_controller.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/detail_lesson_controller.dart';
import '../controllers/question_answers_admin_controller.dart';

class detailLessonAdmin extends StatefulWidget {
  final String code;
  const detailLessonAdmin({Key? key, required this.code}) : super(key: key);

  @override
  _Lesson1AdminState createState() => _Lesson1AdminState();
}

class _Lesson1AdminState extends State<detailLessonAdmin> {
  bool showListQord = true;
  int indexTitle = 0;
  Map<String, bool> showAnswers = {};
  Color wordButtonColor = Colors.black;
  Color wordButtonColor1 = Colors.blue;
  final GlobalKey<FormState> _formKeyW = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyQ = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyP = GlobalKey<FormState>();
  bool showChooseAvatar = false;
  bool showFormAddW = false;
  bool showFormAddQ = false;
  bool showFormAddP = false;
  bool canSubmit = false;
  String avatar = "";
  List<dynamic> words = [];
  List<dynamic> questions = [];
  List<dynamic> listAvatar = [];
  // List<bool> avatarChecks = [];
  late TextEditingController _nameVnController = TextEditingController();
  late TextEditingController _nameEnController = TextEditingController();
  late TextEditingController _countController = TextEditingController();
  late TextEditingController _answerCorrectController = TextEditingController();
  late TextEditingController _answerDetailController = TextEditingController();
  late TextEditingController _answerDetail1Controller = TextEditingController();
  // List<TextEditingController> _answerController = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final word = await DetailLessonController.listWord(widget.code);
      final data1 =
          await QuestionAnswersAdminController.getQuestion(widget.code);
      final dataAvatar = await ProFileController.getListAvatar("");

      setState(() {
        words = word;
        showChooseAvatar = false;
        listAvatar = dataAvatar;
        canSubmit = false;
        questions = data1["answerQ"];
        showFormAddQ = false;
        showFormAddW = false;
        showFormAddP = false;
        _nameVnController.text = "";
        _nameEnController.text = "";
        _countController.text = "";
        avatar = "";
        indexTitle = 0;
        for (dynamic item in questions) {
          indexTitle += item["order"] == 1 ? 1 : 0;
        }
      });
    } catch (e) {
      print('Error hhhh: $e');
    }
  }

  void checkdata() async {
    if (_formKeyW.currentState?.validate() ?? false) {
      String nameVn = _nameVnController.text;
      String nameEn = _nameEnController.text;
      String count = _countController.text;
      dynamic check = await DetailLessonController.addWord(
          widget.code, avatar, nameEn, nameVn, count);
      if (check["status"] == false) {
        fetchData();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(check["title"]),
            actions: [
              TextButton(
                onPressed: () {
                  showFormAddW = !showFormAddW;
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void chooseAvatar() {
    dynamic check = listAvatar.firstWhere((e) => e["isChoose"]);
    setState(() {
      showChooseAvatar = false;
      avatar = check["name"];
    });
  }

  void addNewCombineSentence() async {
    if (_formKeyP.currentState?.validate() ?? false) {
      String sentences = _nameEnController.text;
      String decription = _nameVnController.text;
      dynamic check = await DetailLessonController.addCombine(
          widget.code, sentences, decription);
      if (check["status"] == false) {
        print('3');
        fetchData();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(check["title"]),
            actions: [
              TextButton(
                onPressed: () {
                  showFormAddW = !showFormAddW;
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void addNewQuestion() async {
    if (_formKeyQ.currentState?.validate() ?? false) {
      List<String> answerfalse = [];
      String question = _nameEnController.text;
      String answerCorrect = _answerCorrectController.text;
      String answerDetail1 = _answerDetail1Controller.text;
      String answerDetail = _answerDetailController.text;
      answerfalse.add(answerCorrect);
      answerfalse.add(answerDetail1);
      answerfalse.add(answerDetail);
      dynamic check = await DetailLessonController.addQuestion(
          widget.code, question, avatar, answerfalse);
      if (check["status"] == false) {
        fetchData();
        _answerCorrectController.text = "";
        _answerDetail1Controller.text = "";
        _answerDetailController.text = "";
      } showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(check["title"]),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Future<bool> checkAvatar(String avatar) async {
  //   bool isExists = await doesAssetExist('assets/$avatar');
  //   return isExists;
  // }
  void deleteItem(String code) async {
    try {
      dynamic check = await AccountController.deleteItem(code, "word");
      if (check["status"]) {
        fetchData();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(check["title"]),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Title(
              color: Colors.blue,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Lesson Manager',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("abc1.jpg"))),
                        )
                      ],
                    ),
                  ],
                ),
              ))),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: wordButtonColor1,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      10), // Chỉnh sửa góc trên bên trái
                                  bottomLeft: Radius.circular(10),
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              showListQord = true;
                              showFormAddW = false;
                              showFormAddQ = false;
                              showFormAddP = false;
                              wordButtonColor1 = Colors.blue;
                              wordButtonColor = Colors.black;
                            });
                          },
                          child: Container(
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Word',
                                style: TextStyle(
                                  color: Colors.white, // Màu chữ của nút
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: wordButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    10), // Chỉnh sửa góc trên bên trái
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              showListQord = false;
                              showFormAddW = false;
                              showFormAddQ = false;
                              showFormAddP = false;
                              wordButtonColor1 = Colors.black;
                              wordButtonColor = Colors
                                  .blue; // Chuyển về màu mặc định khi nút được nhấn
                            });
                          },
                          child: Container(
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Question',
                                style: TextStyle(
                                  color: Colors.white, // Màu chữ của nút
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        if (showListQord)
                          ButtonAdd(
                              title: 'Add',
                              onTap: () {
                                setState(() {
                                  showFormAddW = !showFormAddW;
                                  showFormAddQ = false;
                                  showFormAddP = false;
                                });
                              }),
                        if (!showListQord)
                          Row(
                            children: [
                              ButtonAdd(
                                  title: 'Add Qestion',
                                  onTap: () {
                                    setState(() {
                                      showFormAddQ = !showFormAddQ;
                                      showFormAddW = false;
                                      showFormAddP = false;
                                    });
                                  }),
                              const SizedBox(
                                width: 15,
                              ),
                              ButtonAdd(
                                  title: 'Add Sentences',
                                  onTap: () {
                                    setState(() {
                                      showFormAddP = !showFormAddP;
                                      showFormAddQ = false;
                                      showFormAddW = false;
                                    });
                                  }),
                            ],
                          ),
                        if (showFormAddW)
                          Form(
                            key: _formKeyW,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _nameEnController,
                                    labelText: "English",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _nameVnController,
                                    labelText: "Vietnamese",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _countController,
                                  style: const TextStyle(
                                      color: Colors
                                          .black), // Màu chữ của TextFormField
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]'))
                                  ], // Chỉ chấp nhận ký tự số
                                  keyboardType: TextInputType
                                      .number, // Hiển thị bàn phím số
                                  decoration: InputDecoration(
                                    labelText: 'Count',
                                    hintText: '123', // Gợi ý nhập số
                                    errorStyle:
                                        const TextStyle(color: Colors.black),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors
                                              .white), // Màu sắc của đường viền
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                if (avatar != "")
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10),
                                    child: Text(
                                      avatar,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(32, 171, 115, 1.0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              73, 80, 91, 1.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: () {
                                        setState(() {
                                          showChooseAvatar = true;
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          'Choose avatar',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Sumbit',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      checkdata();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        if (showFormAddQ)
                          Form(
                            key: _formKeyQ,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _nameEnController,
                                    labelText: "Question",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                  controller: _answerCorrectController,
                                  labelText: "Answer correct",
                                  hintText: "abc",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _answerDetailController,
                                    labelText: "Answer detail",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _answerDetail1Controller,
                                    labelText: "Answer detail",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 15,
                                ),
                                if (avatar != "")
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10),
                                    child: Text(
                                      avatar,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(32, 171, 115, 1.0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              73, 80, 91, 1.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: () {
                                        setState(() {
                                          showChooseAvatar = true;
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          'Choose avatar',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Sumbit',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      addNewQuestion();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        if (showFormAddP)
                          Form(
                            key: _formKeyP,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _nameEnController,
                                    labelText: "Sentences",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 20,
                                ),
                                UserText(
                                    controller: _nameVnController,
                                    labelText: "Description",
                                    hintText: "abc"),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Sumbit',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      addNewCombineSentence();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: showListQord
                        ? words.length * 115
                        : questions.length * 200,
                    child: ListView.builder(
                      itemCount: showListQord ? words.length : questions.length,
                      itemBuilder: (context, index) {
                        var item =
                            showListQord ? words[index] : questions[index];
                        final bool isShowingAnswers =
                            showAnswers[item['questionCode']] ?? false;
                        if (showListQord) {
                          return Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (index != 0)
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image:
                                                    AssetImage(item['avatar']),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "(EN):  ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  "${item['nameEn']}",
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "(VN): ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "${item['nameVn']}",
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      maxLines: 3,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            deleteItem(item['code']);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (index == 0)
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 1))),
                                  child: const Text(
                                    'Answer the question: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              if (indexTitle == index)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.blue, width: 2))),
                                    child: const Text(
                                      'Combine sentences: ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showAnswers[item['questionCode']] =
                                            !isShowingAnswers;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${item['questionName']}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (item["order"] == 1)
                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors
                                                .black, // Màu của biểu tượng
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (item["order"] == 1)
                                if (isShowingAnswers) ...[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        item['answers'].map<Widget>((answer) {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: answer['isTrue']
                                              ? Colors.greenAccent
                                              : null,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 8, 0, 8),
                                          child: Text(
                                            '${(answer['answerName'])}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showChooseAvatar)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromRGBO(80, 80, 80, 0.4),
            ),
          if (showChooseAvatar)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 450,
                color: const Color.fromRGBO(2, 33, 47, 1.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showChooseAvatar = false;
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 65),
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: listAvatar.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = listAvatar[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (var e in listAvatar) {
                                      e["isChoose"] = false;
                                    }
                                    item["isChoose"] = true;
                                    canSubmit = true;
                                  });
                                },
                                child: Container(
                                  color: Colors.blue[100],
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(item["name"]),
                                                fit: BoxFit.cover)),
                                      ),
                                      if (item["isChoose"])
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.green,
                                                  width: 3)),
                                        ),
                                      if (item["isChoose"])
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green),
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ))
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: !canSubmit
                                    ? const Color.fromRGBO(94, 94, 94, 1.0)
                                    : const Color.fromRGBO(67, 203, 47, 1.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                if (canSubmit) {
                                  chooseAvatar();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Xác nhận',
                                  style: TextStyle(
                                      color: !canSubmit
                                          ? const Color.fromRGBO(
                                              134, 134, 134, 1.0)
                                          : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ButtonAdd extends StatefulWidget {
  final Function onTap;
  final String title;
  const ButtonAdd({super.key, required this.onTap, required this.title});

  @override
  State<ButtonAdd> createState() => _ButtonAddState();
}

class _ButtonAddState extends State<ButtonAdd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                widget.onTap();
              },
              child: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}

class UserText extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  const UserText(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText});

  @override
  State<UserText> createState() => _UserTextState();
}

class _UserTextState extends State<UserText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.black), // Màu chữ của TextFormField
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
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
