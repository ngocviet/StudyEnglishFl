import 'package:flutter/material.dart';

class StatisticalAdmin extends StatefulWidget {
  const StatisticalAdmin({super.key});

  @override
  State<StatisticalAdmin> createState() => _StatisticalAdminState();
}

class _StatisticalAdminState extends State<StatisticalAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text('Statistical',style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20
              ),),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('abc1.jpg')
                  )
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Nút 1'),
              ),
              SizedBox(height: 20), // Khoảng cách giữa hai nút
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Nút 2'),
              ),
            ],
          ),
        ],
      )
    );
  }
}
