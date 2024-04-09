import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../controllers/retings_controller.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ViewRating();
  }
}

class ViewRating extends State<RatingsScreen> {
  late Offset _offset;
  List<dynamic> listRetings = [];
  int totalscore = 0;
  String name = "";
  int retingsNow = 0;
  int rankLastMonths = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
    _offset = Offset(350, 700);
  }

  void fetchData() async {
    try {
      final dataRetings = await RetingsController.getRetings();
      var rankLastMonth = await RetingsController.getRankLastmonth();
      setState(() {
        listRetings = dataRetings["totalScoreByAllUsers"];
        name = dataRetings["totalScoreByUser"]["name"];
        totalscore = dataRetings["totalScoreByUser"]["totalscore"];
        //Vi tri hien tai
        retingsNow = dataRetings["reting"];
        //Vi tri thang truoc
        rankLastMonths = rankLastMonth;
      });
    } catch (e) {
      print('Lỗi hhhh: $e');
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
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                       Row(
                         children: [
                           Container(
                             height: 40,
                             width: 40,
                             decoration: const BoxDecoration(
                               image:DecorationImage(
                                 image: AssetImage('1.png'),
                                 fit: BoxFit.fill,
                               )
                             ),
                           ),
                           Text('Vị trí hiện tại $retingsNow'),
                         ],
                       ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  image:DecorationImage(
                                    image: AssetImage('1.png'),
                                    fit: BoxFit.fill,
                                  )
                              ),
                            ),
                            Text('Vị trí tháng trước $rankLastMonths'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: listRetings.length,
                        itemBuilder: (context, index) {
                          var item = listRetings[index];
                          String avatarImage;
                          if (index == 0 ) {
                            avatarImage = '1.png';
                          } else if (index == 1) {
                            avatarImage = '2.png';
                          } else if(index == 2){
                            avatarImage = '3.png';
                          }else{
                            avatarImage = '';
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(avatarImage))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(item["avartar"]),
                                          fit: BoxFit.fill,
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
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    item['totalscore'].toString(),
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
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: _offset.dx,
            top: _offset.dy,
            child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _offset += details.delta;
                  });
                },
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 60, // Đường kính của hình tròn
                          height: 60, // Đường kính của hình tròn
                          decoration: const BoxDecoration(
                            shape: BoxShape
                                .circle, // Đặt hình dạng của container thành hình tròn
                            color: Color.fromRGBO(255, 77, 245, 1),
                          ),
                          child: const Icon(Icons.light_mode,
                              color: Colors.yellow),
                        ),
                        Positioned(
                          top: 40,
                          child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(255, 77, 245, 1),
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2 // Màu đen cho viền
                                  ),
                            ),
                            child: const Center(
                                child: Text(
                              '2 ngày',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
