import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom/controllers/jitsi_meet_controller.dart';
import 'package:zoom/utils/constants.dart';
import 'package:zoom/views/screens/meeting_screen/reusable_icon_button_widget.dart';

import '../../global_widgets/widgets.dart';
import '../screens_path.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final jitsimeeting = JitsiMeetController();

  createNewMeeting() {
    var random = Random();
    var roomName = (random.nextInt(10000000) + 10000000).toString();

    jitsimeeting.createMeeting(
        roomName: roomName, isAudioMuted: false, isVideoMuted: true);
  }

  joinMeeting() => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => JoinMeetingScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: AppBarWidget(appbarTitle: 'Meet & Chat'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableIconButtonWidget(
                      text: 'New Meeting',
                      iconData: Icons.video_camera_back_outlined,
                      press: createNewMeeting),
                  ReusableIconButtonWidget(
                      text: 'Join Meeting',
                      iconData: Icons.add_box_outlined,
                      press: joinMeeting),
                  ReusableIconButtonWidget(
                      text: 'Schedule',
                      iconData: Icons.calendar_month,
                      press: () {}),
                  ReusableIconButtonWidget(
                      text: 'Share Screen',
                      iconData: Icons.arrow_upward_rounded,
                      press: () {}),
                ],
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Create/Join meeting with just a click',
                    style: createJoinTextStyle,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
