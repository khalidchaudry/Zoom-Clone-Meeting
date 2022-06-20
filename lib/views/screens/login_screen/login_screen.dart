import 'package:flutter/material.dart';
import 'package:zoom/controllers/auth_controller.dart';
import 'package:zoom/views/screens/screens_path.dart';

import '../../global_widgets/widgets.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  AuthController authController = AuthController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset('assets/images/join meeting.png'),
          const SizedBox(
            height: 30,
          ),
          CustomButtonWidget(
              text: 'Login',
              press: () {
                authController.signInWithGoogle();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: ((context) => const MeetAndChatScreen())));
              }),
        ],
      ),
    ));
  }
}
