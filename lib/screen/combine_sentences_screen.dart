import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CombineSentencesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen();
  }
}
class Screen extends State<CombineSentencesScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('giaodien3.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              )),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(75, 75, 75, 1),
                ),
                height: 15,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
              child: Container(
                child: const Text('Tạo một cụm từ',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white,
                                    width: 2
                                )
                            )
                        ),
                        child: const Text(
                            'Chúng tôi muốn uống cà phê.',
                            style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 20, 30),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1
                        )
                      ),
                      child: const Text('Data',style: TextStyle(fontSize: 30,color: Colors.white),),
                    ),
                  ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         child: ElevatedButton(
                  //           style: ButtonStyle(
                  //             shape: MaterialStateProperty.all<OutlinedBorder>(
                  //               RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(20),
                  //                 // side: const BorderSide(color: Colors.white, width: 2),
                  //               ),
                  //             ),
                  //             backgroundColor: MaterialStateProperty.all<Color>(
                  //               const Color.fromRGBO(75, 75, 75, 1),
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             // Xử lý logic
                  //           },
                  //           child: const Center(
                  //             child: Padding(
                  //               padding: EdgeInsets.only(top: 10, bottom: 10),
                  //               child: Text(
                  //                 'coffee',
                  //                 style: TextStyle(color: Colors.white, fontSize: 20),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ButtonStyle(
                  //           shape: MaterialStateProperty.all<OutlinedBorder>(
                  //             RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(20),
                  //               // side: const BorderSide(color: Colors.white, width: 2),
                  //             ),
                  //           ),
                  //           backgroundColor: MaterialStateProperty.all<Color>(
                  //             const Color.fromRGBO(75, 75, 75, 1),
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           // Xử lý logic
                  //         },
                  //         child: const Center(
                  //           child: Padding(
                  //             padding: EdgeInsets.only(top: 10, bottom: 10),
                  //             child: Text(
                  //               'We',
                  //               style: TextStyle(color: Colors.white, fontSize: 20),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       // Thêm các ElevatedButton khác ở đây
                  //     ],
                  //   ),
                  // ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  // side: const BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(75, 75, 75, 1),
                              ),
                            ),
                            onPressed: () {
                              // Xử lý logic
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'coffee',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  // side: const BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(75, 75, 75, 1),
                              ),
                            ),
                            onPressed: () {
                              // Xử lý logic
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'We',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  // side: const BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(75, 75, 75, 1),
                              ),
                            ),
                            onPressed: () {
                              // Xử lý logic
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'coffee',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  // side: const BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(75, 75, 75, 1),
                              ),
                            ),
                            onPressed: () {
                              // Xử lý logic
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'We',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          // Thêm các ElevatedButton khác ở đây
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}