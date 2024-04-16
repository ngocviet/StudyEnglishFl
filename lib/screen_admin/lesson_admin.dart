import 'package:flutter/material.dart';

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
  late TextEditingController _avatarController = TextEditingController();
  bool _isPasswordVisible = false;
  bool showFormAdd = false;
  String? CodeTopic;
  List<dynamic> lessons =[];
  List<dynamic> topics =[];
  void initState() {
    super.initState();
    fetchData();
  }
  void deleteItem(String code) async {
    try {
      dynamic check = await AccountController.deleteItem(code, "lesson" );
      if(check["status"]){
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
      final topic = await LessonAdminController.listTopic();
      setState(() {
        lessons= data1;
        topics = topic;
      });
    } catch (e) {
      print('Error: $e');
    }
  }
  void checkdata() async{
    if (_formKey.currentState?.validate() ?? false) {
      String name = _nameController.text;
      String description = _descriptionController.text ?? "";
      String avatar = _avatarController.text;
      String codeTopic = CodeTopic ?? "";
      dynamic check = await LessonAdminController.addLesson(codeTopic,name,avatar,description);
      if(check["status"] == true){
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Text('Lesson Manager',style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('abc1.jpg')
                    )
                ),
              ),
            ],
          ),
        ),
      body: Column(
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

                            DropdownButtonFormField<String>(
                              value: CodeTopic, // Giá trị được chọn từ ComboBox
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    CodeTopic = newValue;
                                  } // Cập nhật giá trị được chọn
                                });
                              },
                              items: topics.map<DropdownMenuItem<String>>((dynamic topic) {
                                return DropdownMenuItem<String>(
                                  value: topic["code"], // Chuyển đổi giá trị thành chuỗi
                                  child: Text(topic["name"]), // Chuyển đổi giá trị thành chuỗi
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
                              style:
                              TextStyle(color: Colors.black), // Màu chữ của TextFormField
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Name Lesson',
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
                              controller: _descriptionController,
                              style:
                              TextStyle(color: Colors.black), // Màu chữ của TextFormField
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter some text';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                labelText: 'Description',
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
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _avatarController,
                              style: TextStyle(color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'avatar',
                                hintText: 'enter your avatar',
                                errorStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                        builder: (context) => detailLessonAdmin(code: lesson["code"],), // Thay thế SecondScreen bằng màn hình bạn muốn hiển thị
                      ),
                    );
                  },
                  child: Container(
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
                                        image: AssetImage(lesson['avatar']),
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
                                      "Topic: ${lesson['topic']}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Title: ${lesson['name']}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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

    );
  }
}
