import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../controllers/retings_controller.dart';

class RatingsScreen extends StatefulWidget {
  final String codeUser;

  const RatingsScreen({Key? key, required this.codeUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ViewRating();
  }
}

class ViewRating extends State<RatingsScreen> {
  // late Offset _offset;
  List<dynamic> listRetings = [];
  int totalscore = 0;
  String name = "";
  String avatar = "default.jpg";
  int retingsNow = 0;
  int rankLastMonths = 0;
  String month = "";
  @override
  void initState() {
    super.initState();
    fetchData();
    // _offset = Offset(350, 700);
  }

  void fetchData() async {
    try {
      final dataRetings = await RetingsController.getRetings(widget.codeUser);
      setState(() {
        listRetings = dataRetings["totalScoreByAllUsers"];
        name = dataRetings["dataHistory"]["name"];
        avatar = dataRetings["dataHistory"]["avatar"];
        totalscore = dataRetings["dataHistory"]["totalscore"];
        month = DateTime.now().month.toString();
      });
    } catch (e) {
      print('Lỗi RatingsScreen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(2, 33, 47, 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Positioned(
                          top: 14,
                          child: Text(
                            "Thống kê xếp hạng",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('htv_preview_rev_1.png'),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey, width: 2)),
                        color: const Color.fromRGBO(197, 34, 35, 1.0),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Dẫn đầu tháng trước",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(avatar),
                                        fit: BoxFit.contain),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "$name   $totalscore KN",
                                style: const TextStyle(
                                    color: Color.fromRGBO(173, 173, 173, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          "Bảng xếp hạng tháng $month",
                          style: const TextStyle(
                              color: Color.fromRGBO(21, 199, 184, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    // color: Colors.red,
                    child: ListView.builder(
                        itemCount: listRetings.length,
                        itemBuilder: (context, index) {
                          var item = listRetings[index];
                          String avatarImage = "";
                          if (index == 0) {
                            avatarImage = 'vang.png';
                          } else if (index == 1) {
                            avatarImage = 'bac.png';
                          } else if (index == 2) {
                            avatarImage = 'dong.png';
                          } else {
                            avatarImage = "";
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: item["isUser"]
                                    ? const Color.fromRGBO(117, 117, 117, 1.0)
                                    : const Color.fromRGBO(2, 33, 47, 1.0),
                              ),
                              child: Row(
                                children: [
                                  if (avatarImage != "")
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(avatarImage),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  if (avatarImage == "")
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            const Icon(
                                              Icons.bookmark_rounded,
                                              size: 50,
                                              color: Color.fromRGBO(
                                                  55, 141, 21, 1.0),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${index + 1}',
                                                style: const TextStyle(
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(item["avartar"]),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        item['name'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${item['totalscore']} KN',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
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
