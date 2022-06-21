import 'package:flutter/material.dart';
import 'package:zoom/controllers/auth_controller.dart';
import 'package:zoom/controllers/jitsi_meet_controller.dart';
import 'package:zoom/views/screens/join_meeting_screen/widget.dart';

import '../../../utils/colors.dart';
import '../../global_widgets/widgets.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({Key? key}) : super(key: key);

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  AuthController authController = AuthController();
  JitsiMeetController jitsiMeetController = JitsiMeetController();
  TextEditingController roomIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isAudioMuted = false;
  bool isVedioMuted = true;

  @override
  void initState() {
    roomIdController = TextEditingController();
    nameController =
        TextEditingController(text: authController.user!.displayName);

    super.initState();
  }

  joinMeeting() {
    jitsiMeetController.createMeeting(
        roomName: roomIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVedioMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: AppBarWidget(appbarTitle: 'Join a Meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: roomIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: kSecondaryBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'Room ID'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  fillColor: kSecondaryBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'Username'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(text: 'Join', press: joinMeeting),
            const SizedBox(
              height: 20,
            ),
            VoiceOptionWidget(
              isActive: isAudioMuted,
              onChange: onAudioMuted,
              text: 'Mute Audio',
            ),
            const SizedBox(
              height: 20,
            ),
            VoiceOptionWidget(
              isActive: isVedioMuted,
              onChange: onVedioMuted,
              text: 'Turn off video',
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool audioClose) {
    setState(() {
      isAudioMuted = audioClose;
    });
  }

  onVedioMuted(bool videoClose) {
    setState(() {
      isVedioMuted = videoClose;
    });
  }
}
