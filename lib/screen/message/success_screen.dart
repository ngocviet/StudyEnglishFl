import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  final Function onTap;
  const SuccessScreen({super.key, required this.onTap});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(19, 243, 19, 1),
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
                  const Text('Tuyệt vời !',
                      style: TextStyle(
                          color: Color.fromRGBO(19, 243, 19, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)), // Text
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
                    backgroundColor: const Color.fromRGBO(19, 243, 19, 1),
                  ),
                  onPressed: () {
                    widget.onTap();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Tiếp Tục',
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
          ],
        ),
      ),
    );
  }
}
