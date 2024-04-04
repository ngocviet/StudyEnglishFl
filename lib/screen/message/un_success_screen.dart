import 'package:flutter/material.dart';

class UnSuccessScreen extends StatefulWidget {
  final Function onTap;
  final String answer;
  const UnSuccessScreen({super.key, required this.onTap, required this.answer});

  @override
  State<UnSuccessScreen> createState() => _UnSuccessScreenState();
}

class _UnSuccessScreenState extends State<UnSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 230,
      child: Container(
        color: const Color.fromRGBO(9, 21, 9, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(243, 10, 10, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.close,
                          color: Color.fromRGBO(
                              9, 21, 9, 1)),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text('Không chính xác!',
                      style: TextStyle(
                          color: Color.fromRGBO(243, 10, 10, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)), // Text
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Text('Đáp án đúng:',
                      style: TextStyle(
                          color: Color.fromRGBO(243, 10, 10, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: Row(
                  children: [
                Text(
                  widget.answer,
                  style: const TextStyle(
                    color: Color.fromRGBO(243, 10, 10, 1),
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(243, 10, 10, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {
                      widget.onTap();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Đã hiểu',
                        style: TextStyle(
                            color: Color.fromRGBO(9, 21, 9, 1), fontSize: 24),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
