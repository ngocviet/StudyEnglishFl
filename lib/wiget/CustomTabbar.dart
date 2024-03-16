import 'package:flutter/material.dart';

class CustomTabar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabar({super.key, required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(border:Border(
          top: BorderSide(
            color:  Colors.blue,
            width: 3,
          )
      ) ),
      tabs: icons.asMap().map((i,e) => MapEntry(i,  Tab(
        icon:Icon(e,
          color: i == selectedIndex? Colors.blue : Colors.black,
          size: 30,
        ),
      ),
      )).values.toList(),
      onTap: onTap,
    );
  }
}
