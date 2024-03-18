import 'package:flutter/material.dart';
import 'package:project4/screen/home_screen.dart';
import 'package:project4/wiget/CustomTabbar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(body: Container(child: Text('hi',style: TextStyle(color: Colors.black),),),),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.handyman,
    Icons.perm_contact_cal_outlined,
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
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: CustomTabar(
              icons: _icons,
              selectedIndex : _selectedIndex,
              onTap:(index) =>setState(()=>_selectedIndex = index),
            ),
          ),
        )
    );
  }
}
