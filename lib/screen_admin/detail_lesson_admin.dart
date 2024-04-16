import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project4/controllers/lesson_admin_controller.dart';

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
  bool showQuestions1 = true;
  bool showQuestions2 = false;
  Map<String, bool> showAnswers = {};
  List<dynamic> questions = [];
  Color wordButtonColor = Colors.black;
  Color wordButtonColor1 = Colors.blue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool showFormAdd = false;
  String avatar="";
  List<dynamic> words = [];
  late TextEditingController _nameVnController = TextEditingController();
  late TextEditingController _nameEnController = TextEditingController();
  late TextEditingController _countController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
       final word = await DetailLessonController.listWord(widget.code);

      // final acc = await AccountController.getAccountId(widget.code);

      final data1 = await QuestionAnswersAdminController.getQuestion();
      setState(() {
        words = word;
        // accounts = acc;
        questions = data1;
      });
    } catch (e) {
      print('Error hhhh: $e');
    }
  }
  void checkdata() async{
    if (_formKey.currentState?.validate() ?? false) {
      String nameVn = _nameVnController.text;
      String nameEn = _nameEnController.text;
      String count = _countController.text;
      dynamic check = await DetailLessonController.addWord(widget.code, avatar, nameEn, nameVn, count);
      if(check["status"] == false){
        fetchData();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(check["title"]),
              actions: [
                TextButton(
                  onPressed: () {
                    showFormAdd = !showFormAdd;
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }else{
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
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Title(color: Colors.blue,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text('Lesson Manager',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/abc1.jpg',height: 50,width: 50,fit: BoxFit.cover,)),)
                      ],),

                  ],
                ),
              )
          )
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: wordButtonColor1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10), // Chỉnh sửa góc trên bên trái
                            bottomLeft: Radius.circular(10),
                          ),
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        showQuestions1 = true;
                        showQuestions2 = false;
                        wordButtonColor1 = Colors.blue;
                        wordButtonColor = Colors.black;
                      });
                    },
                    child: Container(
                      height: 40,
                      child:
                      const Center(
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
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  wordButtonColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10), // Chỉnh sửa góc trên bên trái
                          bottomRight: Radius.circular(10),
                        ),
                      ),

                    ),
                    onPressed: () {
                      setState(() {
                        showQuestions1 = false;
                        showQuestions2 = true;
                        wordButtonColor1 = Colors.black;
                        wordButtonColor = Colors.blue; // Chuyển về màu mặc định khi nút được nhấn
                      });
                    },
                    child: Container(
                      height: 40,
                      child:
                      const Center(
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
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 75,
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              setState(() {
                                showFormAdd = !showFormAdd;

                              });
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (showFormAdd)
                    Form(
                      key: _formKey,
                      child:Container(
                        // padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _nameEnController,
                              style:
                              TextStyle(color: Colors.black), // Màu chữ của TextFormField
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'English',
                                hintText: 'abc',
                                errorStyle: const TextStyle(color: Colors.black),
                                labelStyle: const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white), // Màu sắc của đường viền
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                               controller: _nameVnController,
                              style:
                              TextStyle(color: Colors.black), // Màu chữ của TextFormField
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Tiếng Việt',
                                hintText: 'abc',
                                errorStyle: const TextStyle(color: Colors.black),
                                labelStyle: const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white), // Màu sắc của đường viền
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _countController,
                              style: TextStyle(color: Colors.black), // Màu chữ của TextFormField
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))], // Chỉ chấp nhận ký tự số
                              keyboardType: TextInputType.number, // Hiển thị bàn phím số
                              decoration: InputDecoration(
                                labelText: 'Count',
                                hintText: '123', // Gợi ý nhập số
                                errorStyle: const TextStyle(color: Colors.black),
                                labelStyle: const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white), // Màu sắc của đường viền
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
                    )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child:ListView.builder(
                itemCount: showQuestions1 ? words.length : questions.length,
                itemBuilder: (context, index) {
                  var word = showQuestions1 ? words[index] : questions[index];
                  final bool isShowingAnswers = showAnswers[word['questionCode']] ?? false;
                  if(showQuestions1) {
                    return  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(10)
                          )
                      ),
                      onPressed: () {
                      },
                      child:
                      Container(
                        color: Colors.white,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(word['avatar']),
                                            fit: BoxFit.cover
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "English: ${word['nameEn']}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Việt Nam: ${word['nameVn']}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    );
                  } else{
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width , 70),
                            ),
                            onPressed: () {
                              setState(() {
                                showAnswers[word['questionCode']] = !isShowingAnswers;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${word['questionName']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black, // Màu của biểu tượng
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (isShowingAnswers) ...[

                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: word['answers'].map<Widget>((answer) {
                                return Container(
                                  color: answer['isTrue'] ? Colors.blue : null,
                                  child:
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10), // Độ bo tròn ở đây là 10
                                      ),
                                    ),
                                    onPressed: () {

                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.6,
                                      height: 40,
                                      child: Center(
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${(answer['answerName'])}',style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              ),


                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                        Divider(),
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
