import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListVocabularyScreen extends StatelessWidget {
  const ListVocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Từ Vựng Của Bạn',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('giaodien3.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                )),
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('luaphai.png'),
                            ),
                          ),
                        ),
                        Center(
                          child: Stack(
                            children: [
                              // Border
                              Text(
                                "42",
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 10 // Độ dày của border
                                    ..color = Colors.purple, // Màu của border
                                ),
                              ),
                              // Text
                              const Text(
                                "42",
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Màu của chữ
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('luatrai.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Tôi đang học 30 từ',style: TextStyle(fontSize: 17),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Đã học 12 từ',style: TextStyle(fontSize: 17),)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                child: const Text('Đã đến lúc để ôn lại',style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              const SizedBox(height: 30,),
              Container(
                  width: 400,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Coffee',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Spacer(), // Khoảng trống linh hoạt
                      Icon(
                        Icons.check,
                        size: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.volume_up,
                          size: 24,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // Xóa padding mặc định của ElevatedButton
                          shape: CircleBorder(), // Đặt hình dạng của ElevatedButton thành hình tròn
                        ),
                      ),
                    ],
                  )

              )
            ],
          ),
        ));
  }
}
