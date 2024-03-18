import 'package:flutter/material.dart';

class ChooseTitleScreen extends StatelessWidget {
  const ChooseTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz,
                    size: 30, color: Colors.white)),
            const Text(
              'Học Tập',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.more_horiz, size: 30, color: Colors.white))
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(58, 58, 58, 54),
                Colors.black87
              ], // Màu sắc cho gradient
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('giaodien2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Bài Học Số 1.',
                        style: TextStyle(color: Colors.amber, fontSize: 23),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Cái gì có sẵn - some và any',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: 370,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,8,0,8),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 130,
                          width: 120,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, // Sử dụng hình tròn
                              color: Colors.white,
                              image: DecorationImage(image: AssetImage('abc1.jpg'),fit: BoxFit.cover)
                              ),
                        ),
                        const SizedBox(width: 30),
                        const Text(
                          "Học từ vựng",
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: 370,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,8,0,8),
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle, // Sử dụng hình tròn
                            color: Colors.white,
                              image: DecorationImage(image: AssetImage('hoicham2.png'),fit: BoxFit.cover)
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Trả lời câu hỏi",
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: 370,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,8,0,8),
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 120,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, // Sử dụng hình tròn
                              color: Colors.white,
                              image: DecorationImage(image: AssetImage('ghepcau1.jpg'),fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Trả lời câu hỏi",
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                        )
                      ],
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
