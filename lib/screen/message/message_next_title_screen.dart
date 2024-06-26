import 'package:flutter/material.dart';

class MessageNextTitleScreen extends StatefulWidget {
  final String title;
  final Function onTap;

  const MessageNextTitleScreen({super.key, required this.title, required this.onTap});

  @override
  State<MessageNextTitleScreen> createState() => _MessageNextTitleScreenState();
}

class _MessageNextTitleScreenState extends State<MessageNextTitleScreen> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: const Color.fromRGBO(9, 21, 9, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("congratulations.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(19, 157, 243, 1.0),
                      shape: BoxShape
                          .circle, // Hình dạng của icon là hình tròn
                    ),
                    child: const Center(
                      child: Icon(Icons.check,
                          color:
                          Color.fromRGBO(9, 21, 9, 1)), // Icon hình tích (tick)
                    ),
                  ),
                  const SizedBox(
                      width: 15), // Khoảng cách giữa icon và text
                  const Text('Bạn đã hoàn thành phần ',
                      style: TextStyle(
                          color: Color.fromRGBO(210, 226, 236, 1.0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text(widget.title,
                      style: const TextStyle(
                          color: Color.fromRGBO(19, 157, 243, 1.0),
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),// Text
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,30,20,30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color.fromRGBO(19, 157, 243, 1.0),
                  ),
                  onPressed: () {
                    widget.onTap();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Đi tiếp',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 21, 9, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
