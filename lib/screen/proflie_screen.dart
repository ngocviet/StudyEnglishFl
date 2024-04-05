import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProFileScreen extends StatefulWidget {
  const ProFileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewProFile();
  }
}

class ViewProFile extends State<ProFileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(2, 33, 47, 1.0),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 225,
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage('avatar.jpg'),
                //   fit: BoxFit.cover,
                // ),
                color: Color.fromRGBO(2, 33, 47, 1.0),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(159, 159, 159, 1.0),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {

                        },
                        child: const Icon(Icons.settings,size: 35,color: Colors.white,),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('avatar.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Màu của đường viền
                    width: 3.0, // Độ rộng của đường viền
                  ),
                ),
              ),
              height: 150, // Chiều cao cố định cho phần tiếp theo
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          'Quang Hướng',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 15),
                        child: Text(
                          '@QuangHuong1062003',
                          style: TextStyle(color: Color.fromRGBO(
                              159, 159, 159, 1.0), fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 15),
                        child: Text(
                          'Đã tham gia tháng Mười Hai 2024',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Màu của đường viền
                    width: 3.0, // Độ rộng của đường viền
                  )
                )
              ),
              height: 200,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Thành Tích',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('1.png'))),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('phone.jpg'),
                              fit: BoxFit.fill,
                            )
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Nguyen Quang Huong',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text('200 KN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Thống Kê',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: const Border(
                            top: BorderSide(width: 2.0, color: Colors.grey),
                            bottom: BorderSide(width: 2.0, color: Colors.grey),
                            left: BorderSide(width: 2.0, color: Colors.grey),
                            right: BorderSide(width: 2.0, color: Colors.grey),
                          ),
                        ),
                        child:const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                   Icon(
                                    Icons.local_fire_department_rounded,
                                    color: Colors.orangeAccent,
                                    size: 50,
                                  ),
                                  Text('1',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Ngày streak',style: TextStyle(fontSize: 20,color: Colors.grey),)
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                      SizedBox(width: 13,),
                      Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: const Border(
                              top: BorderSide(width: 2.0, color: Colors.grey),
                              bottom: BorderSide(width: 2.0, color: Colors.grey),
                              left: BorderSide(width: 2.0, color: Colors.grey),
                              right: BorderSide(width: 2.0, color: Colors.grey),
                            ),
                          ),
                          child:const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.light_mode,
                                      color: Colors.orangeAccent,
                                      size: 50,
                                    ),
                                    Text('3882',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Tổng KN',style: TextStyle(fontSize: 20,color: Colors.grey),)
                                  ],
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
