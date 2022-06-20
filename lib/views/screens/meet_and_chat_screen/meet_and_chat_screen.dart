import 'package:flutter/material.dart';

import 'package:zoom/views/screens/meeting_screen/meeting_screen.dart';
import 'package:zoom/views/screens/person_screen/person_screen.dart';
import 'package:zoom/views/screens/settings_screen/settings_screen.dart';

import 'widgets.dart';

class MeetAndChatScreen extends StatefulWidget {
  const MeetAndChatScreen({Key? key}) : super(key: key);

  @override
  State<MeetAndChatScreen> createState() => _MeetAndChatScreenState();
}

class _MeetAndChatScreenState extends State<MeetAndChatScreen> {
  final List<Widget> pageRoute = [
    MeetingScreen(),
    const PersonScreen(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        pageIndex: currentIndex,
        press: (int currentValue) {
          setState(() {
            currentIndex = currentValue;
          });
        },
      ),
      body: pageRoute[currentIndex],
    );
  }
}
