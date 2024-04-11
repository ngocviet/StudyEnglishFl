import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class NotificationResultScreen extends StatefulWidget {
  final String codeUser;
  final int percentW;
  final int percentQ;
  final int percentP;
  final int miss;
  final int pass;
  const NotificationResultScreen({
    super.key,
    required this.codeUser,
    required this.percentW,
    required this.percentQ,
    required this.percentP, required this.miss, required this.pass,
  });

  @override
  State<NotificationResultScreen> createState() =>
      _NotificationResultScreenState();
}

class _NotificationResultScreenState extends State<NotificationResultScreen> {
  @override
  Widget build(BuildContext context) {
    int percent = (widget.pass / (widget.pass + widget.miss) * 100).round().toInt();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(4, 40, 56, 1.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 151,
                              height: 151,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      const Color.fromRGBO(180, 180, 180, 1.0),
                                  width: 6,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '$percent%',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                        Positioned(
                          top: 2,
                          left: 2,
                          child: SizedBox(
                            width: 147,
                            height: 147,
                            child: CustomPaint(
                              painter: HalfRedHalfBlueBorderCirclePainter(
                                  percent: percent),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Thật tuyệt vời!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Hãy tiếp tục cố gắng nhé!',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Item(total: widget.miss, status: false),
                    Item(total: widget.pass, status: true),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Item1(title: "Học từ vựng", percentWidth: widget.percentW / 100),
              Item1(title: "Trả lời câu hỏi",percentWidth: widget.percentQ / 100),
              Item1(title: "Ghép từ", percentWidth: widget.percentP / 100),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(67, 203, 47, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Tiếp tục',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HalfRedHalfBlueBorderCirclePainter extends CustomPainter {
  late final int percent;

  HalfRedHalfBlueBorderCirclePainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromRGBO(55, 150, 23, 1.0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    double halfWidth = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = math.min(halfWidth, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -math.pi / 2,
      2 * math.pi * percent / 100,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Item extends StatelessWidget {
  final int total;
  final bool status;

  const Item({super.key, required this.total, required this.status});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: status
                ? const Color.fromRGBO(197, 227, 183, 1.0)
                : const Color.fromRGBO(225, 178, 178, 1.0),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$total',
                style: TextStyle(
                    color: status ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.close,
                    size: 22,
                    color: status ? Colors.green : Colors.red,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    status ? 'Correct' : 'Mistakes',
                    style: TextStyle(
                        color: status ? Colors.green : Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class Item1 extends StatelessWidget {
  final String title;
  final double percentWidth;

  const Item1({super.key, required this.percentWidth, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(197, 206, 215, 1.0),
                borderRadius: BorderRadius.circular(14)),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: percentWidth,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: percentWidth > 0.7
                            ? const Color.fromRGBO(34, 222, 48, 1.0)
                            : percentWidth > 0.4
                                ? const Color.fromRGBO(225, 216, 42, 1.0)
                                : const Color.fromRGBO(225, 108, 23, 1.0),
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
