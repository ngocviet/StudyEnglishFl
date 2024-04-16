import 'package:flutter/material.dart';
import 'package:project4/controllers/profile_controller.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/lesson_admin_controller.dart';
import 'detail_lesson_admin.dart';

class LessonAdmin extends StatefulWidget {
  const LessonAdmin({super.key});

  @override
  State<LessonAdmin> createState() => _LessonAdminState();
}

class _LessonAdminState extends State<LessonAdmin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _descriptionController = TextEditingController();
  bool showChooseAvatar = false;
  bool showFormAdd = false;
  bool canSubmit = false;
  String? CodeTopic;
  String avatar = "";
  List<dynamic> lessons = [];
  List<dynamic> topics = [];
  List<dynamic> listAvatar = [];
  void initState() {
    super.initState();
    fetchData();
  }

  void deleteItem(String code) async {
    try {
      dynamic check = await AccountController.deleteItem(code, "lesson");
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

  void fetchData() async {
    try {
      final data1 = await LessonAdminController.listLesson();
      final dataAvatar = await ProFileController.getListAvatar("");
      final topic = await LessonAdminController.listTopic();
      setState(() {
        listAvatar = dataAvatar;
        lessons = data1;
        topics = topic;
        showChooseAvatar = false;
        showFormAdd = false;
        canSubmit = false;
        CodeTopic;
        avatar = "";
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void checkdata() async {
    if (_formKey.currentState?.validate() ?? false) {
      String name = _nameController.text;
      String description = _descriptionController.text ?? "";
      String codeTopic = CodeTopic ?? topics[0]["code"];
      dynamic check = await LessonAdminController.addLesson(
          codeTopic, name, avatar, description);
      if (check["status"] == false) {
        fetchData();
        _nameController.text = "";
        _descriptionController.text = "";
        avatar = "";
        showFormAdd = false;
        CodeTopic = null;
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
    }
  }

  void chooseAvatar(){
    dynamic check = listAvatar.firstWhere((e) => e["isChoose"]);
    setState(() {
      showChooseAvatar = false;
      avatar = check["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const Text(
                'Lesson Manager',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('abc1.jpg'))),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
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
                          child: Container(
                            // padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButtonFormField<String>(
                                  value: CodeTopic, // Giá trị được chọn từ ComboBox
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        CodeTopic = newValue;
                                      }
                                    });
                                  },
                                  items: topics.map<DropdownMenuItem<String>>(
                                      (dynamic topic) {
                                    return DropdownMenuItem<String>(
                                      value: topic[
                                          "code"], // Chuyển đổi giá trị thành chuỗi
                                      child: Text(topic[
                                          "name"]), // Chuyển đổi giá trị thành chuỗi
                                    );
                                  }).toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Topic',
                                    hintText: 'Choose your topic',
                                    errorStyle: TextStyle(color: Colors.black),
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _nameController,
                                  style: const TextStyle(
                                      color: Colors
                                          .black), // Màu chữ của TextFormField
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Name Lesson',
                                    hintText: 'abc',
                                    errorStyle:
                                        const TextStyle(color: Colors.black),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintStyle: const TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors
                                              .white), // Màu sắc của đường viền
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _descriptionController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    hintText: 'abc',
                                    errorStyle:
                                        const TextStyle(color: Colors.black),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintStyle: const TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors
                                              .white), // Màu sắc của đường viền
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                if(avatar != "")
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10, left: 10),
                                    child: Text(avatar, style: const TextStyle(color: Color.fromRGBO(
                                        32, 171, 115, 1.0), fontWeight: FontWeight.bold,fontSize: 18),),
                                  ),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              73, 80, 91, 1.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)),
                                          padding: const EdgeInsets.all(0)
                                      ),
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
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    var lesson = lessons[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailLessonAdmin(
                              code: lesson["code"],
                            ), // Thay thế SecondScreen bằng màn hình bạn muốn hiển thị
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(lesson['avatar']),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${lesson['name']}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "(${lesson['topic']})",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        deleteItem(lesson["code"]);
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
                      ),
                    );
                  },
                ),
              ),
            ],
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
