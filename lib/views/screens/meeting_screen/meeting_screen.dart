import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom/controllers/jitsi_meet_controller.dart';
import 'package:zoom/utils/constants.dart';
import 'package:zoom/views/screens/meeting_screen/reusable_icon_button_widget.dart';

import '../../../utils/colors.dart';

// ignore: use_key_in_widget_constructors
class MeetingScreen extends StatelessWidget {
  final jitsimeeting = JitsiMeetController();

  createNewMeeting() {
    var random = Random();
    var roomName = (random.nextInt(100000) + 100000).toString();

    jitsimeeting.createMeeting(
        roomName: roomName, isAudioMuted: false, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Meet & Chat',
            style: appBarTextStyle,
          ),
          backgroundColor: kBackgroundColor,
          elevation: 0,
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
                      press: () {}),
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
