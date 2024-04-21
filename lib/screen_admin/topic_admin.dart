import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/profile_controller.dart';
import 'package:project4/controllers/register_controller.dart';
import 'package:project4/controllers/topic_admin.dart';

import '../controllers/account_admin_controller.dart';
import '../controllers/choose_topic_controller.dart';
import 'detail_topic_admin.dart';
class TopicAdmin extends StatefulWidget {
  const TopicAdmin({super.key});

  @override
  State<TopicAdmin> createState() => _TopicAdminState();
}

class _TopicAdminState extends State<TopicAdmin> {
  List<dynamic> topics = [];
  List<dynamic> listAvatar = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _comboColorController = TextEditingController();
  String avatar = "";
  String comboColor = "128-222-182";
  bool showFormAdd = false;
  bool showChooseAvatar = false;
  bool canSubmit = false;

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data1 = await TopicAdmin1.getTopic();
      final dataAvatar = await ProFileController.getListAvatar("");

      setState(() {
        topics = data1;
        showChooseAvatar = false;
        canSubmit = false;
        listAvatar = dataAvatar;
        comboColor = "128-222-182";
        _comboColorController.text = comboColor;
        avatar = "";
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void deleteItem(String code) async {
    try {
      dynamic check = await AccountController.deleteItem(code, "topic" );
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
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  void checkData() async {
    if (_formKey.currentState?.validate() ?? false) {
      String name = _nameController.text;
      String comboColor = _comboColorController.text;
      dynamic data = await TopicAdmin1.AddTopicAPI(name, avatar, comboColor);
      if (data["status"] == true) {
        fetchData();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(data["title"]),
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

  void submitAdd() async{
    if (_formKey.currentState?.validate() ?? false) {
      String name = _nameController.text;
      // String comboColor = _comboColorController.text;
      dynamic check = await TopicAdmin1.AddTopicAPI(name, avatar, comboColor);
      if(check["status"] == true){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(check["title"]),
              actions: [
                TextButton(
                  onPressed: () {
                    fetchData();
                    showFormAdd = !showFormAdd;
                    _nameController.text = "";
                    _comboColorController.text = "";
                    avatar = "";
                    comboColor = "128-222-182";
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

  void chooseAvatar(){
    dynamic check = listAvatar.firstWhere((e) => e["isChoose"]);
    setState(() {
      showChooseAvatar = false;
      avatar = check["name"];
    });
  }

  void renderColor(String value){
    var check = value.split('-');
    bool isAllInt = check.every((element) => int.tryParse(element) != null);
    // print(isAllInt);
    if(check.length == 3 && isAllInt){
      setState(() {
        comboColor = value;
      });
    }else{
      setState(() {
        comboColor = "128-222-182";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var listColor = comboColor.split('-').map((e) => int.parse(e)).toList();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar:AppBar(
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
                          child: const Text('Topic Manager',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Book.png")),
                              shape: BoxShape.circle),
                        ),
                      ],),

                  ],
                ),
              )
          )
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  style:
                                  const TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'NameToPic',
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
                                  height: 20,
                                ),
                                Stack(
                                  children: [
                                    TextFormField(
                                      controller: _comboColorController,
                                      style: const TextStyle(color: Colors.black),
                                      onChanged: (value){
                                        renderColor(value);
                                      },// Màu chữ của TextFormField
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Background',
                                        hintText: '1-1-1',
                                        errorStyle: const TextStyle(color: Colors.black),
                                        labelStyle: const TextStyle(color: Colors.black),
                                        hintStyle: const TextStyle(color: Color.fromRGBO(
                                            31, 98, 62, 1.0),fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white), // Màu sắc của đường viền
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 12, right: 10),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          color: Color.fromRGBO(listColor[0], listColor[1], listColor[2], 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
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
                                      submitAdd();
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
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    var topic = topics[index];
                    return Container(
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(topic['avatar']),
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
                                        '${topic['name']}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        '(ID: ${topic['id']})',
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
                                      deleteItem(topic["code"]);
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
                          child: Icon(
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
