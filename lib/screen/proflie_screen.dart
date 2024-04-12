import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/screen/login_screen.dart';

class ProFileScreen extends StatefulWidget {
  final String codeUser;
  final Function logout;

  const ProFileScreen({super.key, required this.codeUser, required this.logout});

  @override
  State<StatefulWidget> createState() {
    return ViewProFile();
  }
}

class ViewProFile extends State<ProFileScreen> {
  bool showAction = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
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
                      color: Color.fromRGBO(2, 33, 47, 1.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('vinhhalong.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: -10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  showAction = !showAction;
                                });
                              },
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
                                  'Hướng',
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
                                    borderRadius: BorderRadius.circular(10),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                231, 208, 132, 1.0),
                                            width: 1))),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5, left: 5),
                                child: Text(
                                  '@quanghuong',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 5, bottom: 20),
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
                                        color:
                                            Color.fromRGBO(159, 159, 159, 1.0),
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
                                        color:
                                            Color.fromRGBO(159, 159, 159, 1.0),
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
                                            Icon(
                                              Icons.bookmark_rounded,
                                              size: 50,
                                              color: Color.fromRGBO(
                                                  55, 141, 21, 1.0),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons
                                                  .local_fire_department_rounded,
                                              color: Colors.orangeAccent,
                                              size: 40,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Stack(
                                              children: [
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
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
                                                    color: Colors
                                                        .white, // Màu của chữ
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Ngày streak',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.bolt_rounded,
                                              color: Colors.orangeAccent,
                                              size: 34,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Stack(
                                              children: [
                                                Text(
                                                  '1000',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
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
                                                    color: Colors
                                                        .white, // Màu của chữ
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Tổng KN',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons
                                                  .local_fire_department_rounded,
                                              color: Colors.orangeAccent,
                                              size: 40,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Stack(
                                              children: [
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
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
                                                    color: Colors
                                                        .white, // Màu của chữ
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Ngày streak',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.adjust_rounded,
                                              color: Colors.orangeAccent,
                                              size: 36,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Stack(
                                              children: [
                                                Text(
                                                  '1000',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
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
                                                    color: Colors
                                                        .white, // Màu của chữ
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Tổng KN',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey),
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
            if (showAction)
              Positioned(
                top: 50,
                right: 20,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(86, 86, 86, 1.0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Item(
                        title: "Đổi tên",
                        status: false,
                        onTap: () {},
                      ),
                      Item(
                        title: "Đổi mật khẩu",
                        status: false,
                        onTap: () {},
                      ),
                      Item(
                        title: "Đăng xuất",
                        status: true,
                        onTap: () {
                          widget.logout();
                        },
                      ),
                    ],
                  ),
                ),
              )
          ],
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

class Item extends StatelessWidget {
  final String title;
  final bool status;
  final Function onTap;
  const Item(
      {super.key,
      required this.title,
      required this.status,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            padding: !status
                ? EdgeInsets.fromLTRB(0, 15, 0, 0)
                : EdgeInsets.fromLTRB(0, 15, 0, 15)),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
