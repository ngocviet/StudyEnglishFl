import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //note tách Appbar và bottomNavigationBar thành 1 class chung
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz,
                    size: 30, color: Colors.white)),
            const Text(
              'Home',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.more_horiz, size: 30, color: Colors.white))
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(58, 58, 58, 54),
                Colors.black87
              ], // Màu sắc cho gradient
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('back1.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              )),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                        child: Container(
                      width: 260,
                      height: 260,
                      decoration: const BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                        image: AssetImage('header.png'),
                        fit: BoxFit.contain,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: Column(
                          children: [
                            Container(
                              width: 150,
                              height: 50,
                              // color: Colors.blue,
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: null,
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      Icons.local_fire_department_rounded,
                                      color: Colors.orangeAccent,
                                      size: 50,
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, right: 2),
                              child: Text(
                                'Chuỗi ngày',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Cấp độ 1',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )))),
            // Container(
            //   width: double.infinity,
            //   height: 1,
            //   color: Colors.red,
            // ),
            Expanded(
                flex: 5,
                child: Container(
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Center(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.greenAccent,
                            border: Border.all(
                              color: Colors.grey,
                              width: 8,
                            ),
                            image: DecorationImage(
                                image: const AssetImage('cartoon.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken,
                                ))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Bài học 43',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(205, 205, 205, 1)),
                              ),
                            ),
                            Container(
                              width: 160,
                              // color: Colors.greenAccent,
                              child: const Text('Cái gì có sãn - some và any',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 40),
                              width: 220,
                              height: 70,
                              // color: Colors.red,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      // color: Colors.blue,
                                      child: const IconButton(
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.star_border_rounded,
                                          size: 75,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      // color: Colors.blue,
                                      child: const IconButton(
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.star_border_rounded,
                                          size: 75,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      // color: Colors.blue,
                                      child: const IconButton(
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.star_border_rounded,
                                          size: 75,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.all(13.0),
                                    child: Text(
                                      'Bắt đầu',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
