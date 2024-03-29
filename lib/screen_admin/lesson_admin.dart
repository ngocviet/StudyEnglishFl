import 'package:flutter/material.dart';

class LessonAdmin extends StatefulWidget {
  const LessonAdmin({super.key});

  @override
  State<LessonAdmin> createState() => _LessonAdminState();
}

class _LessonAdminState extends State<LessonAdmin> {
  bool showQuestions = false;
  bool showQuestions1 = false;

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
                child: Text('Lesson Manager',style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('abc1.jpg')
                    )
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children:
                [
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
                          showQuestions = !showQuestions;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100]!.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(child: Text('1',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue
                              ),
                            )),
                          ),
                          Text('Word',style: TextStyle(
                            fontSize: 16,color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black, // Màu của biểu tượng
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (showQuestions) ...[
                    SizedBox(height: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Độ bo tròn ở đây là 10
                        ),
                      ),
                      onPressed: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 40,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Word Question',style: TextStyle(
                                color: Colors.black,
                              ),),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 40,
                        child: Center(
                          child: Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Answer',style: TextStyle(
                                color: Colors.black,
                                ),),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                  SizedBox(height: 20), // Khoảng cách giữa hai nút
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
                          showQuestions1 = !showQuestions1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.lightBlue[100]!.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(child: Text('2',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue
                              ),
                            )),
                          ),
                          Text('Quesion',style: TextStyle(
                              fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black, // Màu của biểu tượng
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (showQuestions1) ...[
                    SizedBox(height: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Độ bo tròn ở đây là 10
                        ),
                      ),
                      onPressed: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 40,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Question',style: TextStyle(
                                color: Colors.black,
                              ),),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: 40,
                        child: Center(
                          child: Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Answer',style: TextStyle(
                                  color: Colors.black,
                                ),),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ],

          ),
        )
    );
  }
}
