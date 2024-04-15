import 'package:flutter/material.dart';

import 'package:project4/wiget/CustomTabbar.dart';
import '../screen_admin/home_admin.dart';

class NavScreenAdmin extends StatefulWidget {
  final String codeUser;
  const NavScreenAdmin({super.key, required this.codeUser});

  @override
  State<NavScreenAdmin> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreenAdmin> {
  late final List<Widget> _screens;

  final List<IconData> _icons = const [
    Icons.home,
  ];
  @override
  void initState() {
    super.initState();
    _screens = [
      HomeAdmin(code: widget.codeUser,),
    ];
  }

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
