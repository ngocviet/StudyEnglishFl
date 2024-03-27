import 'package:flutter/material.dart';

class LearnWordScreen extends StatelessWidget {
  const LearnWordScreen({super.key});

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
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              )),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(75, 75, 75, 1),
                    ),
                    height: 15,
                    width: 350,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(75, 75, 75, 1),
                      shape: BoxShape.circle,
                    ),
                    height: 40,
                    width: 40,
                    child: const Center(
                        child: Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
                child: Text(
                  'Chọn bản dịch',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
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
                          'Xem TV',
                          style: TextStyle(color: Colors.white, fontSize: 20)
                         ),
                       ),
                    ],
                  ),
                      ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, top: 0, bottom: 0, right: 20),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('Xem-phim.jpg'),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 0, bottom: 0, right: 20),
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
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Watch TV',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
