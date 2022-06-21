import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/utils/constants.dart';

class VoiceOptionWidget extends StatelessWidget {
  const VoiceOptionWidget(
      {Key? key,
      required this.text,
      required this.onChange,
      required this.isActive})
      : super(key: key);
  final String text;
  final Function(bool) onChange;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kSecondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: appBarTextStyle,
          ),
          Switch(activeColor: Colors.blue, value: isActive, onChanged: onChange)
        ],
      ),
    );
  }
}
