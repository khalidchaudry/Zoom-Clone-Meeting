import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key, required this.press, required this.pageIndex}) : super(key: key);

  final int pageIndex;
  final Function(int value) press;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: press,
        currentIndex: pageIndex,
        backgroundColor: kFooterColor,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank_outlined), label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock_outlined), label: 'Meeting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Person'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ]);
  }
  
}