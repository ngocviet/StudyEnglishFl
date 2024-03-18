import 'package:flutter/material.dart';
import 'package:project4/controllers/home_controller.dart';

class StatisticalScreen extends StatelessWidget {
  StatisticalScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Mài dũa kỹ năng',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration:
          const BoxDecoration(color: Color.fromRGBO(50, 50, 50, 1.0)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              width: double.infinity,
              color: const Color.fromRGBO(50, 50, 50, 1.0),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(85, 85, 85, 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        'Ôn lại các từ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        padding:
                                        const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                        width: 200,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color.fromRGBO(
                                              119, 0, 192, 1.0),
                                        ),
                                        child: const Text(
                                          'coffee, like, work, study',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('handle.png'),
                                                fit: BoxFit.cover)),
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
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(85, 85, 85, 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        'Bài tập trắc nghiệm',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        padding:
                                        const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color.fromRGBO(
                                              119, 0, 192, 1.0),
                                        ),
                                        child: const Text(
                                          'coffee, like, work',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('book.png'),
                                                fit: BoxFit.cover)),
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
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Text(
                                  'Bộ sưu tập của bạn',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      fontStyle: FontStyle.normal),
                                )),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(0, 20, 00, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    45, 45, 45, 1.0),
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            child: const Center(
                                              child: Text(
                                                '29 từ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic),
                                              ),
                                            ),
                                          )),
                                      const SizedBox(width: 20),
                                      Expanded(
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    45, 45, 45, 1.0),
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            child: const Center(
                                              child: Text(
                                                '10 bài tập',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Hôm nay',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      fontStyle: FontStyle.normal)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lock_clock,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('2 tiếng',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          // height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width: 180,
                                        height: 220,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                45, 45, 45, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:38.0),
                                          child: Column(
                                            children: [
                                              const Text('Tốt',style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 100, 255, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.italic)),
                                              const Text('6',style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 100, 255, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.italic)),
                                              const Text('Từ mới',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.italic)),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 2,
                                                  color: Colors.orange,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width: 180,
                                        height: 220,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                45, 45, 45, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:38.0),
                                          child: Column(
                                            children: [
                                              const Text('Tuyệt vời',style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 100, 255, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.italic)),
                                              const Text('2',style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 100, 255, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.italic)),
                                              const Text('Bài tập đã làm',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.italic)),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 2,
                                                  color: Colors.orange,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        width: 180,
                                        height: 220,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                45, 45, 45, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:38.0),
                                          child: Column(
                                            children: [
                                              const Text('Tốt',style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 100, 255, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.italic)),
                                              const Text('3',style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      160, 100, 255, 1.0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  fontStyle: FontStyle.italic)),
                                              const Text('Từ đã ôn tập',style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.italic)),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 2,
                                                  color: Colors.orange,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
