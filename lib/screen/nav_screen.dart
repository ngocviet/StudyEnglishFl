import 'package:flutter/material.dart';
import 'package:project4/screen/home_screen.dart';
import 'package:project4/screen/list_vocabulary_screen.dart';
import 'package:project4/screen/proflie_screen.dart';
import 'package:project4/screen/ratings_screen.dart';
import 'package:project4/screen/statistical_screen.dart';
import 'package:project4/screen/thuong.dart';
import 'package:project4/screen_admin/answer_admin.dart';
import 'package:project4/wiget/CustomTabbar.dart';

import '../screen_admin/account_admin.dart';
import 'detail_lesson_screen.dart';
import 'huongtestapi.dart';
import 'list_lessons_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    StatisticalScreen(),
    RatingsScreen(),
    ProFileScreen(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.airplay_rounded,
    Icons.bar_chart,
    Icons.person,
    // Icons.add,
    // Icons.abc,
    // Icons.abc_outlined
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          // appBar: ,
          // body: IndexedStack(
          //   index: _selectedIndex,
          //   children: _screens,
          // ),
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: CustomTabar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ));
  }
}
