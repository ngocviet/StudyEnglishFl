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
      body: SingleChildScrollView(
        physics: FixedExtentScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                  //   image: AssetImage('vinhhalong.jpg'),
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
                            // color: const Color.fromRGBO(159, 159, 159, 1.0),
                            image: const DecorationImage(
                              image: AssetImage('vinhhalong.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.settings,
                            size: 35,
                            color: Colors.white,
                          ),
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
                            shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10, left: 5),
                            child: Text(
                              'Quang Hướng',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("vietnam.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5, left: 5),
                            child: Text(
                              '@QagHuog1063',
                              style: TextStyle(
                                  color: Color.fromRGBO(159, 159, 159, 1.0),
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5, left: 5, bottom: 20),
                            child: Text(
                              'Đã tham gia tháng Mười Hai 2024',
                              style: TextStyle(
                                  color: Color.fromRGBO(159, 159, 159, 1.0),
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Thành Tích',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 170,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Các vị trí đã đạt: ',
                                style: TextStyle(
                                    color: Color.fromRGBO(159, 159, 159, 1.0),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('1.png'))),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('2.png'))),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('3.png'))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 170,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'Vị trí hien tai: ',
                                style: TextStyle(
                                    color: Color.fromRGBO(159, 159, 159, 1.0),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: const Center(
                                    child: Stack(
                                      children: [
                                        Icon(Icons.bookmark_rounded,size: 50,color: Color.fromRGBO(
                                            55, 141, 21, 1.0),),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '5',
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Thống Kê',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1
                                )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.local_fire_department_rounded,
                                          color: Colors.orangeAccent,
                                          size: 40,
                                        ),
                                        SizedBox(width: 5,),
                                        Stack(
                                          children: [
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =
                                                  6 // Độ dày của border
                                                  ..color = Colors
                                                      .orangeAccent, // Màu của border
                                              ),
                                            ),
                                            const Text(
                                              '1',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                Colors.white, // Màu của chữ
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top:8.0),
                                      child: Text(
                                        'Ngày streak',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.bolt_rounded,
                                          color: Colors.orangeAccent,
                                          size: 34,
                                        ),
                                        SizedBox(width: 5,),
                                        Stack(
                                          children: [
                                            Text(
                                              '1000',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =
                                                  6 // Độ dày của border
                                                  ..color = Colors
                                                      .orangeAccent, // Màu của border
                                              ),
                                            ),
                                            const Text(
                                              '1000',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                Colors.white, // Màu của chữ
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top:8.0),
                                      child: Text(
                                        'Tổng KN',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1
                                )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.local_fire_department_rounded,
                                          color: Colors.orangeAccent,
                                          size: 40,
                                        ),
                                        SizedBox(width: 5,),
                                        Stack(
                                          children: [
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =
                                                  6 // Độ dày của border
                                                  ..color = Colors
                                                      .orangeAccent, // Màu của border
                                              ),
                                            ),
                                            const Text(
                                              '1',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                Colors.white, // Màu của chữ
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top:8.0),
                                      child: Text(
                                        'Ngày streak',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.adjust_rounded,
                                          color: Colors.orangeAccent,
                                          size: 36,
                                        ),
                                        SizedBox(width: 5,),
                                        Stack(
                                          children: [
                                            Text(
                                              '1000',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =
                                                  6 // Độ dày của border
                                                  ..color = Colors
                                                      .orangeAccent, // Màu của border
                                              ),
                                            ),
                                            const Text(
                                              '1000',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                Colors.white, // Màu của chữ
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top:8.0),
                                      child: Text(
                                        'Tổng KN',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
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
    );
  }
}

class Item1 extends StatefulWidget {
  final String title;
  final List<dynamic> listPosit;
  const Item1({super.key, required this.title, required this.listPosit});

  @override
  State<Item1> createState() => _Item1State();
}

class _Item1State extends State<Item1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Color.fromRGBO(159, 159, 159, 1.0), fontSize: 18),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                  itemCount: widget.listPosit.length,
                  itemBuilder: (context, index) {
                    var item = widget.listPosit[index];
                    return Row(
                      children: [
                        if (item["onTop"])
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('1.png'))),
                          ),
                        if (!item["onTop"])
                          const SizedBox(
                            height: 50,
                            width: 50,
                            child: Text('4'),
                          ),
                      ],
                    );
                  }),
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
                    image: DecorationImage(image: AssetImage('2.png'))),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('3.png'))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
