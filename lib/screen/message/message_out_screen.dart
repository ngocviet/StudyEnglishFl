import 'package:flutter/material.dart';

class MessageOutScreen extends StatefulWidget {
  final Function onTapContinue;
  final Function onTapExit;
  const MessageOutScreen({super.key, required this.onTapContinue, required this.onTapExit});

  @override
  State<MessageOutScreen> createState() => _MessageOutScreenState();
}

class _MessageOutScreenState extends State<MessageOutScreen> {
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
                    image: AssetImage("cty.png")
                  )
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text('Bạn chưa hoàn thành bài tập',
                      style: TextStyle(
                          color: const Color.fromRGBO(19, 157, 243, 1.0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Text('Bạn chắc chắn muốn thoát!',
                    style: TextStyle(
                        color: const Color.fromRGBO(19, 157, 243, 1.0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)), // Text
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
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
                    widget.onTapContinue();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tiếp tục học',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 21, 9, 1),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color.fromRGBO(9, 21, 9, 1),
                  ),
                  onPressed: () {
                    widget.onTapExit();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Thoát',
                      style: TextStyle(
                        color: Color.fromRGBO(182, 9, 9, 1.0),
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
