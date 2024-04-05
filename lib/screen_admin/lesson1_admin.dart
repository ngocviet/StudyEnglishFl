import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/controllers/lesson_admin_controller.dart';

import '../controllers/account_admin_controller.dart';

class Lesson1Admin extends StatefulWidget {
  final String code;
  const Lesson1Admin({Key? key, required this.code}) : super(key: key);

  @override
  _Lesson1AdminState createState() => _Lesson1AdminState();
}

class _Lesson1AdminState extends State<Lesson1Admin> {
  bool showQuestions1 = true;
  bool showQuestions2 = false;

  Color wordButtonColor = Colors.black;
  Color wordButtonColor1 = Colors.blue;


  List<dynamic> words = [];
  List<dynamic> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final word = await LessonAdminController.GetWord();

      final acc = await AccountController.getAccountId(widget.code);
      setState(() {
        words = word;
        accounts = acc;
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
          backgroundColor: Colors.white,
          title: Title(color: Colors.blue,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Lesson Manager',style: TextStyle(
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
      body: Padding(
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
                        shape: RoundedRectangleBorder(
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
                      Center(
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
                      shape: RoundedRectangleBorder(
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
                      Center(
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
            SizedBox(height: 20),
            Expanded(
              child:ListView.builder(
                itemCount: words.length,
                itemBuilder: (context, index) {
                  var word = words[index];
                  if(showQuestions1)
                    return  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(10)
                          )
                      ),
                      onPressed: () {

                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          '${word['nameEN']}: ${word['nameVN']}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                          softWrap: true,

                        ),
                      ),
                    );
                  else{
                    return Text("2");
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
