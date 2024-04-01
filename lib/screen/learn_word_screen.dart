import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/controllers/learn_word_controller.dart';
class LearnWordScreen extends StatefulWidget{
  LearnWordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewScreen();
  }
}
class ViewScreen extends State<LearnWordScreen>{
  late String nameEN="";
  late String nameVN="";
  late String Avatar="";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final data = await learnWordController.getDataQuestion();

      setState(() {
      nameEN = data['nameEN'];
      nameVN = data['nameVN'];
      Avatar = data['avatar'];
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Học Tập',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('giaodien3.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              )),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Chọn bản dịch',
                    style: TextStyle(fontSize: 20, color: Colors.grey,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.messenger_rounded,
                          color: Color.fromRGBO(208, 197, 100, 1.0),
                          size: 28,
                        ),
                      ),
                      Container(
                        child: Text(
                            nameEN,
                            style: const TextStyle(color: Colors.white, fontSize: 22)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20, top: 30, bottom: 0, right: 20),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: AssetImage(Avatar),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(75, 75, 75, 1),
                                ),
                              ),
                              onPressed: () {
                                // xu ly logic
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  nameVN,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Expanded(
                  //         child: ElevatedButton(
                  //             style: ButtonStyle(
                  //               backgroundColor:
                  //               MaterialStateProperty.all<Color>(
                  //                 const Color.fromRGBO(75, 75, 75, 1),
                  //               ),
                  //             ),
                  //             onPressed: () {
                  //               // xu ly logic
                  //             },
                  //             child: const Padding(
                  //               padding: EdgeInsets.all(10),
                  //               child: Text(
                  //                 'Ăn',
                  //                 style: TextStyle(
                  //                     color: Colors.white, fontSize: 22),
                  //               ),
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

