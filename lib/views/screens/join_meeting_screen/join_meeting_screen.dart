import 'package:flutter/material.dart';
import 'package:zoom/views/screens/join_meeting_screen/widget.dart';

import '../../global_widgets/widgets.dart';

class JoinMeetingScreen extends StatelessWidget {
  const JoinMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: AppBarWidget(appbarTitle: 'Join a Meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [InputFieldWidget()],
        ),
      ),
    );
  }
}
