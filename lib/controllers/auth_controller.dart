import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => auth.authStateChanges();
  User? get user => auth.currentUser;
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    User? user = userCredential.user;
    if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        firebaseFirestore.collection('users').doc(user.uid).set({
          'username': user.displayName,
          'uid': user.uid,
          'profilePicture': user.photoURL,
        });
      }
    }
  }
}
