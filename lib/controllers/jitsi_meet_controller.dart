import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/controllers/auth_controller.dart';
import 'package:zoom/controllers/firestore_controller.dart';

class JitsiMeetController {
  final authController = AuthController();
  final FireStoreController fireStoreController = FireStoreController();
  createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username.isEmpty) {
        name = authController.user!.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = name
        ..userEmail = authController.user!.email
        ..userAvatarURL = authController.user!.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      fireStoreController.addMeetingToFireStore(meetingName: roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
