import 'package:flutter/material.dart';
import 'package:project4/screen/home_screen.dart';
import 'package:project4/screen/proflie_screen.dart';
import 'package:project4/screen/ratings_screen.dart';
import 'package:project4/screen/statistical_screen.dart';
import 'package:project4/wiget/CustomTabbar.dart';

class NavScreen extends StatefulWidget {
  final String codeUser;
  const NavScreen({super.key, required this.codeUser});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  late final List<Widget> _screens;

  final List<IconData> _icons = const [
    Icons.home,
    Icons.airplay_rounded,
    Icons.bar_chart,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(
        codeUser: widget.codeUser,
      ),
      StatisticalScreen(
        codeUser: widget.codeUser,
      ),
      RatingsScreen(
        codeUser: widget.codeUser,
      ),
      ProFileScreen(
        codeUser: widget.codeUser,
        logout: () {
          Navigator.pop(context);
        },
      ),
    ];
  }

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
