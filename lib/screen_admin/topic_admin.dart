import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool showFormAdd = false;

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data1 = await TopicAdmin1.getTopic();

      setState(() {
        // accounts = data ;
        topics = data1;
      });
    } catch (e) {
      print('Error: $e');
    }
  }
  void deleteItem(String code) async {
    try {
      dynamic check = await AccountController.deleteItem(code, "topic");
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

  void checkData() async {
    if (_formKey.currentState?.validate() ?? false) {
      String UserName = _userNameController.text;
      String PassWord = _passwordController.text;
      String Name = _nameController.text;
      dynamic dataregister = await RegisterController.getRegister(UserName, PassWord, Name);
      if (dataregister["status"] == true) {
        fetchData();
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(dataregister["title"]),
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

  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _userNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      hintText: 'abc',
                                      errorStyle: TextStyle(color: Colors.black),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      labelStyle: TextStyle(color: Colors.black),
                                      hintStyle: TextStyle(color: Colors.black45),
                                      border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _nameController,
                                    validator: (value) {
                                      // add email validation
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      hintText: 'abc@gmail.com',
                                      errorStyle: TextStyle(color: Colors.black),
                                      prefixIcon: const Icon(
                                        Icons.adobe_rounded,
                                        color: Colors.black87,
                                      ),
                                      labelStyle: TextStyle(color: Colors.black),
                                      hintStyle:
                                      const TextStyle(color: Colors.black45),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .black), // Màu sắc của đường viền
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }

                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    obscureText: !_isPasswordVisible,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'enter your password',
                                      errorStyle: TextStyle(color: Colors.black),
                                      prefixIcon: const Icon(
                                        Icons.lock_outlined,
                                        color: Colors.black87,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black87,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                            !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                      labelStyle: TextStyle(color: Colors.black),
                                      hintStyle: TextStyle(color: Colors.black45),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors
                                                .black), // Màu sắc của đường viền
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                height: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () {
                                      checkData();
                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          )
                        ],
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
                                    'Id: ${topic['id']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Title: ${topic['name']}',
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
    );
  }
}
