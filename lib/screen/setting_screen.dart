import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                  'Hồ Sơ',
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
      body: Container(
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
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(),
            //     )
            //   ),
            // )
          ],
        ),
        ),
      );
  }
}
