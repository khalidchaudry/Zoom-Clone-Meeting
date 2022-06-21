import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  addMeetingToFireStore({required String meetingName}) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
