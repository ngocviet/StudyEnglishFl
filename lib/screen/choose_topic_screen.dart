import 'package:flutter/material.dart';
import 'package:project4/controllers/choose_topic_controller.dart';
import 'package:project4/models/topic.dart';

class ChooseTopicScreen extends StatefulWidget {

  final String codeUser;
  const ChooseTopicScreen({super.key, required this.codeUser});

  @override
  State<ChooseTopicScreen> createState() => _ChooseTopicScreenState();
}

class _ChooseTopicScreenState extends State<ChooseTopicScreen> {

  List<dynamic> listData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final rp = await ChooseTopicController.getListTopic(widget.codeUser);
      setState(() {
        listData = rp;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Chọn chủ đề',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    //variable detail
                    var item = listData[index];
                    var colors = item['comboColor'].split("-").map(int.parse).toList();
                    double wPercent = 150;
                    double sPercent = item['compleLesson'] / item['totalLesson'] * wPercent;
                    sPercent = sPercent < 18 ? 18 : sPercent;
                    double leftPadding = index == 0 ? 70 : 40;
                    double rightPadding = index == listData.length - 1 ? 65 : 0;

                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
                          child: Container(
                            width: 300,
                            height: 600,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    colors[0], colors[1], colors[2], 1.0),
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(item['img']),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(40)),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    bottom: 8),
                                                child: Text(
                                                  'CHỦ ĐỀ ${index + 1}',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                item['title'],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    bottom: 20),
                                                child: Container(
                                                  width: wPercent,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                      color: const Color
                                                          .fromRGBO(
                                                          49, 45, 45, 0.3),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(8)),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: sPercent,
                                                        height: 16,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .yellowAccent,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .end,
                                                          children: [
                                                            Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration: BoxDecoration(
                                                                  color: const Color
                                                                      .fromRGBO(
                                                                      227,
                                                                      185,
                                                                      69,
                                                                      1.0),
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      8)),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${item['compleLesson']} trên ${item['totalLesson']} baì học đã hoàn thành',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontStyle:
                                                    FontStyle.italic),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context, item['codeTopic']);
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 70,
                                                    child: const Center(
                                                        child: Text(
                                                          'Đến đây',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              fontSize: 20),
                                                        )),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
