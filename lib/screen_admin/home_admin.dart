import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:project4/screen_admin/account_admin.dart';
import 'package:project4/screen_admin/detail_lesson_admin.dart';
import 'package:project4/screen_admin/lesson_admin.dart';
import 'package:project4/screen_admin/statistical_admin.dart';
import 'package:project4/screen_admin/topic_admin.dart';

import '../controllers/account_admin_controller.dart';

class HomeAdmin extends StatefulWidget {
  final String code;
  const HomeAdmin({super.key, required this.code});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  String name = "";
  String avatar = "default.jpg";
  List<dynamic> accounts = [];

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.code);
      setState(() {
        accounts = data;
        name = accounts[0]['name'];
        avatar = accounts[0]['avatar'];

      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Home Manager - $name',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  //padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('${avatar}'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Container(
            //   alignment: Alignment.topLeft,
            //   child: Text('Find your information!!!'),
            // )
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Item(avatar: "abc1.jpg", title: "Manager Account", status: true, onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountAdmin()
                        )
                    );
                  }),
                  const SizedBox(width: 20,),
                  Item(avatar: "Book.png", title: "Manager Topic", status: true, onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TopicAdmin()
                        )
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Item(avatar: "question.jpg", title: "Manager Lesson", status: true, onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LessonAdmin()
                        )
                    );
                  }),
                  const SizedBox(width: 20,),
                  Item(avatar: "hoicham2.png", title: ".....", status: true, onTap: (){
                    (){};
                  }),
                ],
              ),
            ],
          )
      ),
    );
  }
}

class Item extends StatefulWidget {
  final String avatar;
  final String title;
  final bool status;
  final Function onTap;

  const Item({super.key, required this.avatar, required this.title, required this.status, required this.onTap});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.4 , 100),
        ),
        onPressed: () {
          widget.onTap();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image(image: AssetImage(widget.avatar),)
            ),
            const SizedBox(height: 5,),
            Text(widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
