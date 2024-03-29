import 'package:flutter/material.dart';
import 'package:project4/wiget/CustomTabbar.dart';
import '../screen_admin/home_admin.dart';
import 'huongtestapi.dart';

class NavScreenAdmin extends StatefulWidget {
  const NavScreenAdmin({super.key});

  @override
  State<NavScreenAdmin> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreenAdmin> {
  final List<Widget> _screens = [
    HomeAdmin(id_user: 1,),

  ];

  final List<IconData> _icons = const [
    Icons.home,

  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
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
