import 'package:flutter/material.dart';
import 'package:project4/screen/first_screen.dart';
import 'package:project4/screen/nav_screen_admin.dart';
import 'screen/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const NavScreen(codeUser: "viet_1"),
      home: const NavScreenAdmin(codeUser: "admin"),
      // home: const FirstScreen(),
    );
  }
}
