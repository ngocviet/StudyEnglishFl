import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/screen/login_screen.dart';

import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';

class ProFileScreen extends StatefulWidget {
  final String codeUser;
  final Function logout;

  const ProFileScreen(
      {super.key, required this.codeUser, required this.logout});

  @override
  State<StatefulWidget> createState() {
    return ViewProFile();
  }
}

class ViewProFile extends State<ProFileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showAction = false;
  bool showChooseAvatar = false;
  bool canSubmit = false;
  int userPosition = 0;
  int totalscore = 0;
  String totalDay = "0";
  String name = "";
  String username = "";
  String pass = "";
  String avatar = "default.jpg";
  String createtime = "";
  bool ShowName = true;
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _Pass = TextEditingController();
  List<dynamic> listCups = [];
  List<dynamic> listAvatar = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final datauser = await ProFileController.getUser(widget.codeUser);
      final datacups = await ProFileController.getCups(widget.codeUser);
      final dataDay = await HomeController.getDay(widget.codeUser);
      final dataAvatar = await ProFileController.getListAvatar(widget.codeUser);
      setState(() {
        listCups = datacups;
        listAvatar = dataAvatar;
        name = datauser["dataUser"]["name"];
        username = datauser["dataUser"]["userName"];
        pass = datauser["dataUser"]["pass"];
        avatar = datauser["dataUser"]["avatar"];
        createtime = datauser["dataUser"]["createdtime"];
        userPosition = datauser["userPosition"];
        totalscore = datauser["totalscore"];
        totalDay = dataDay['totalDay'];
        canSubmit = false;
      });
    } catch (e) {
      print('Lỗi hhhh: $e');
    }
  }

  void Save() async {
    String Name = _Name.text;
    dynamic result = await ProFileController.editName(widget.codeUser, Name);
    if (result["status"] == true) {
      setState(() {
        ShowName = true;
        name = Name;
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(result["title"]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void SavePass() async {
    if (_formKey.currentState?.validate() ?? false) {
      String Pass = _Pass.text;
      dynamic result = await ProFileController.editPass(widget.codeUser, Pass);
      if (result["status"] == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(result["title"]),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      ShowName = true;
                    });
                    Navigator.of(context).pop(); // Đóng dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(result["title"]),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      ShowName = true;
                    });
                    Navigator.of(context).pop(); // Đóng dialog
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

  void changeAvatar() async {
    dynamic check = listAvatar.firstWhere((e) => e["isChoose"]);

    dynamic result = await ProFileController.editAvatar(widget.codeUser, check["name"]);
    if (result["status"] == true) {
      final dataAvatar = await ProFileController.getListAvatar(widget.codeUser);
      setState(() {
        listAvatar = dataAvatar;
        ShowName = true;
        avatar = check["name"];
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(result["title"]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    canSubmit = false;
    showChooseAvatar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(avatar),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (ShowName == false)
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, right: 10),
                                  child: Container(
                                    height: 40,
                                    child: Stack(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: name,
                                              hintText: name,
                                              errorStyle: const TextStyle(
                                                  color: Colors.white),
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                              labelStyle: const TextStyle(
                                                  color: Colors.white),
                                              hintStyle: const TextStyle(
                                                  color: Colors.white54),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                ), // Màu sắc của đường viền
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            style: const TextStyle(
                                                color: Colors.white),
                                            controller: _Name,
                                            // Đặt controller nếu cần thiết
                                            // controller: nameController,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Save();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          67, 203, 47, 1.0),
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(8),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      8))),
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5)),
                                              child: const Text(
                                                "Lưu",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            else
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("vietnam.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(231, 208, 132, 1.0),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 5),
                              child: Text(
                                "@$username",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, bottom: 20),
                              child: Text(
                                'Đã tham gia $createtime',
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
                            SizedBox(
                              width: 15,
                            ),
                            const SizedBox(
                              width: 170,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Thành tựu: ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(159, 159, 159, 1.0),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            if (listCups.length > 0)
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listCups.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    '${listCups[index]["position"]}.png'))),
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            const SizedBox(
                              width: 170,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Vị trí hiện tại: ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1.0),
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          if (userPosition > 3)
                                            const Icon(
                                              Icons.bookmark_rounded,
                                              size: 50,
                                              color: Color.fromRGBO(
                                                  55, 141, 21, 1.0),
                                            ),
                                          if (userPosition > 3)
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                userPosition.toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          if (userPosition == 1)
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image:
                                                          AssetImage('1.png'))),
                                            ),
                                          if (userPosition == 2)
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image:
                                                          AssetImage('2.png'))),
                                            ),
                                          if (userPosition == 3)
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image:
                                                          AssetImage('3.png'))),
                                            ),
                                          if (userPosition == 0)
                                            const Text(
                                              "...",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
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
                      const SizedBox(
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
                                            Icons.local_fire_department_rounded,
                                            color: Colors.orangeAccent,
                                            size: 40,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Text(
                                                totalDay,
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
                                              Text(
                                                totalDay,
                                                style: const TextStyle(
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
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          const SizedBox(
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
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Stack(
                                            children: [
                                              Text(
                                                totalscore.toString(),
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
                                              Text(
                                                totalscore.toString(),
                                                style: const TextStyle(
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
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                      onTap: () {
                        setState(() {
                          ShowName = false;
                          showAction = !showAction;
                        });
                      },
                    ),
                    Item(
                      title: "Đổi mật khẩu",
                      status: false,
                      onTap: () {
                        setState(() {
                          showAction = !showAction;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Color.fromRGBO(2, 33, 47, 1.0),
                                content: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "PassWord",
                                      hintText: "PassWord",
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintStyle: const TextStyle(
                                          color: Colors.white54),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ), // Màu sắc của đường viền
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    controller: _Pass,
                                  ),
                                ), // Hiển thị dữ liệu "quang huong"
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      SavePass();
                                      Navigator.of(context)
                                          .pop(); // Đóng dialog
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      },
                    ),
                    Item(
                      title: "Đổi ảnh đại diện",
                      status: false,
                      onTap: () {
                        setState(() {
                          showAction = !showAction;
                          showChooseAvatar = true;
                        });
                      },
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
                                  changeAvatar();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Thay đổi',
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
