import 'package:flutter/material.dart';
import 'package:project4/controllers/home_controller.dart';
import 'package:project4/models/account.dart';
import 'package:project4/screen/choose_title_screen.dart';
import 'package:project4/screen/choose_topic_screen.dart';

class HomeScreen extends StatefulWidget {
  final String codeUser;
  const HomeScreen({super.key, required this.codeUser});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Variables
  String totalDay = "0";
  String topic = "";
  String codeTopic = "GD";
  List<dynamic> listLesson = [];
  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await HomeController.getDataTopic(codeTopic);

      final data1 = await HomeController.getListLesson(widget.codeUser, codeTopic);

      final data2 = await HomeController.getDay(widget.codeUser);
      setState(() {
        topic = 'Chủ đề ${data['stt']}';
        listLesson = data1;
        totalDay = data2['totalDay'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void chooseTopic(code){
    if(code != null){
      setState(() {
        codeTopic = code;
      });
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(width: 1,),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('htv_preview_rev_1.png'),
                      fit: BoxFit.contain),
                ),
              ),
              const SizedBox(width: 60,)
            ],
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(30, 30, 30, 54),
                  Colors.black87
                ], // Màu sắc cho gradient
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          // physics: const FixedExtentScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
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
                    child: SizedBox(
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
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const IconButton(
                                        onPressed: null,
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.local_fire_department_rounded,
                                          color: Colors.orangeAccent,
                                          size: 50,
                                        ),
                                      ),
                                      Center(
                                        child: Stack(
                                          children: [
                                            Text(
                                              '$totalDay',
                                              style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =
                                                      6 // Độ dày của border
                                                  ..color = Colors
                                                      .orangeAccent, // Màu của border
                                              ),
                                            ),
                                            Text(
                                              totalDay,
                                              style: const TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    Colors.white, // Màu của chữ
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChooseTopicScreen(codeUser: widget.codeUser)),
                                        ).then((value) {
                                          chooseTopic(value);
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(9),
                                        child: Text(
                                          topic,
                                          style: const TextStyle(
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
                Expanded(
                    flex: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: listLesson.length,
                      itemBuilder: (BuildContext context, int index) {
                        var lesson = listLesson[index];
                        double leftPadding = index == 0 ? 70 : 40;
                        double rightPadding =
                            index == listLesson.length - 1 ? 65 : 0;
                        var statusStar = List<bool>.filled(3, false);
                        for (int i = 0; i < lesson['totalStar']; i++) {
                          statusStar[i] = true;
                        }
                        return Padding(
                          padding: EdgeInsets.only(
                              left: leftPadding, right: rightPadding),
                          child: Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 8,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(lesson['img']),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Bài học số ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(205, 205, 205, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 160,
                                    child: Text(
                                      lesson['title'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(right: 40),
                                    width: 220,
                                    height: 70,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                statusStar[0]
                                                    ? Icons.star_purple500_sharp
                                                    : Icons.star_outline,
                                                size: 75,
                                                color: statusStar[0]
                                                    ? Colors.yellow
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                statusStar[1]
                                                    ? Icons.star_purple500_sharp
                                                    : Icons.star_outline,
                                                size: 75,
                                                color: statusStar[1]
                                                    ? Colors.yellow
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                statusStar[2]
                                                    ? Icons.star_purple500_sharp
                                                    : Icons.star_outline,
                                                size: 75,
                                                color: statusStar[2]
                                                    ? Colors.yellow
                                                    : Colors.white,
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChooseTitleScreen(
                                                    codeLesson: lesson['code'],
                                                    codeUser: widget.codeUser,
                                                    title: lesson['title'],
                                                    sttLesson:
                                                    'Bài học số ${index + 1}',
                                                  )
                                              // LearnWordScreen()
                                              ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(13.0),
                                        child: Text(
                                          'Bắt đầu',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
